#!/usr/bin/perl

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# this program is run by bfg. It does not take any parameters. Instead, it simply reads
# its parameters from the environment

# Env. variables
#
# BFG_BLOB: the id of the blob (a SHA)
# BFG_FILENAME: basename of the file to process. it has an extension
# BFG_MEMO_DIR: directory of memoized files
# BFG_TOKENIZE_CMD: command to tokenize, might include parameters
#
# this program must not have any parameters
# it should get all its parameters from the environment

use strict;
use warnings;

# Modyfy TOKEN_WINDOW_SIZE to control the number of tokens to extract
use constant TOKEN_WINDOW_SIZE => $ENV{BFG_WINDOW_SIZE};

use Digest::SHA qw(sha1_hex);
use DBI;
use File::Temp qw/ tempfile tempdir mkstemp/;
use File::Path qw(make_path);
use File::Copy;

my %mapLang = (
    "c"    => 'C',
    "c++"  => 'C++',
    "cc"   => 'C++',
    "cp"   => 'C++',
    "cpp"  => 'C++',
    "cxx"  => 'C++',
    "go"   => 'Go',
    "h"    => 'C',
    "h++"  => 'C++',
    "hh"   => 'C++',
    "hpp"  => 'C++',
    "java" => 'Java',
    "md"   => "Markdown",
    "yaml" => "Yaml",
    "ac"   => "M4",
    "am"   => "M4",
);

if (not defined($ENV{BFG_MEMO_DIR}) || $ENV{BFG_MEMO_DIR} eq "") {
    die "You must define the environment variable BFG_MEMO_DIR equal to the directory where to memoize";
}

my $shaDir = $ENV{BFG_MEMO_DIR};

if ($shaDir eq "") {
    die "Directory to use to memoize not set. Use BFG_MEMO_DIR environment variable to set";
}

my $tokenizeCmd = $ENV{BFG_TOKENIZE_CMD};
if ($tokenizeCmd eq "") {
    die ("Tokenize command not defined. Use environment variable BFG_TOKENIZE_CMD");
}

die "Sha dir [$shaDir] does not exist" if not -d $shaDir;

my $contents = join("", <>);
my $sha1 = sha1_hex($contents);

my $dir      = $shaDir . '/' . substr($sha1, 0, 2) . '/' . substr($sha1, 2, 2);
my $filename = $dir . '/' . $sha1;

my $blob   = $ENV{BFG_BLOB};
my $blobFN = $ENV{BFG_FILENAME};

die "BFG_FILENAME environment variable not set " if $blobFN eq "";

my $fileExt;
if ($blobFN =~ /\.([^.]+)$/) {
    $fileExt = lc($1);
}

if (not defined($mapLang{$fileExt})) {
    die "unknown file extension [$fileExt]";
}

if (-f $filename) {
    open(my $in, "<", $filename) || die "unable to open memoized file [$filename]";
    my $saved_contents = join("", <$in>);
    print $saved_contents;
    close($in);
}

else {
    my ($fh, $file)      = mkstemp("tmpfile-in-XXXXX");
    my ($fout, $outfile) = mkstemp("tmpfile-out-XXXXX");
    print $fh $contents;
    close $fh;

    my $langOp = "--language=" . $mapLang{$fileExt};

    my @buffer = ();
    push @buffer, "FileStart" for (1 .. (TOKEN_WINDOW_SIZE - 1));

    open(my $proc, "-|", "$tokenizeCmd $langOp $file")
        or die "unable to execute $tokenizeCmd (verify variable BFG_TOKENIZE_CMD) [$tokenizeCmd]";

    while (my $token = <$proc>) {
        chomp $token;

        $token = "comment" if $token =~ /^comment\|/;

        push @buffer, $token;

        if (scalar @buffer == TOKEN_WINDOW_SIZE) {
            my $output_line = join(' ', @buffer);
            print "$output_line\n";
            print $fout "$output_line\n";

            shift @buffer;
        }
    }
    close($proc);

    push @buffer, "FileEnd" while scalar @buffer < TOKEN_WINDOW_SIZE;

    while (scalar @buffer >= TOKEN_WINDOW_SIZE) {
        my $output_line = join(' ', @buffer);
        print "$output_line\n";
        print $fout "$output_line\n";
        shift @buffer;
    }

    close $fout;

    if (not -d $dir) {
        make_path($dir);
    }

    move($outfile, $filename)
        or die "The move operation to memoized directory failed: $!";

    unlink($file);
}
