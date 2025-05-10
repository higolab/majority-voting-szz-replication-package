# 基本イメージの選択
FROM sbtscala/scala-sbt:8-jdk-focal

# 必要な環境変数の設定
ENV BFG_MEMO_DIR=/tmp/memo
ENV BFG_TOKENIZE_CMD="/workspaces/tools/cregit/tokenize/tokenizeSrcMl.pl --srcml2token=/workspaces/tools/cregit/tokenize/srcMLtoken/srcml2token --srcml=srcml --ctags=ctags"

# 必要なパッケージのインストール
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wget \
        git \
        build-essential \
        ctags \
        cmake \
        libarchive-dev \
        libxml++2.6-dev \
        libxml2-dev \
        libcurl4-openssl-dev \
        libxslt1-dev \
        libboost-all-dev \
        libantlr-dev \
        libssl-dev \
        libxerces-c-dev \
        exuberant-ctags \
        libdbi-perl \
        libjgit-java \
        libhtml-fromtext-perl \
        libset-scalar-perl \
        libdbd-sqlite3-perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# srcML のインストール
WORKDIR /opt

RUN wget https://github.com/srcML/srcMLReleases/raw/main/srcml_1.0.0-1_ubuntu20.04.deb \
    && dpkg -i srcml_1.0.0-1_ubuntu20.04.deb \
    && rm srcml_1.0.0-1_ubuntu20.04.deb

# bfg-repo-cleaner のクローンとビルド
RUN git clone https://github.com/dmgerman/bfg-repo-cleaner.git --branch blobexec \
    && cd bfg-repo-cleaner \
    && sbt bfg/assembly \
    && cd ..

WORKDIR /workspaces

VOLUME ["/workspaces"]

# デフォルトシェルの設定
CMD ["/bin/bash"]
