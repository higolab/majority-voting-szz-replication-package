cd ../../../../dataset

# Clone Defects4J
git clone -b v2.1.0 https://github.com/rjust/defects4j.git defects4j

cd defects4j
cpanm --installdeps .
./init.sh
