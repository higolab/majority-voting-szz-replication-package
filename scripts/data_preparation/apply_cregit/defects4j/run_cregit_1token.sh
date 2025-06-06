#!/bin/bash

set -eu

export BFG_WINDOW_SIZE=1

mkdir /workspaces/dataset/repositories/defects4j/1token_github.com

cp -r /workspaces/dataset/repositories/defects4j/github.com/* /workspaces/dataset/repositories/defects4j/1token_github.com/

REPO_BASE="/workspaces/dataset/repositories/defects4j/1token_github.com"

function wrap_cregit() {
    local target=$1

    local owner=$(echo "$target" | cut -d '/' -f 1)
    local repo=$(echo "$target" | cut -d '/' -f 2)

    export BFG_MEMO_DIR="$REPO_BASE/$target/memo"
    mv "$REPO_BASE/$owner/$repo" "$REPO_BASE/$owner/$repo-original"
    cd "$REPO_BASE/$owner/$repo-original"

    mkdir -p "$REPO_BASE/$owner/$repo"
    mv "$REPO_BASE/$owner/$repo-original" "$REPO_BASE/$owner/$repo/"
    cp -r "$REPO_BASE/$owner/$repo/$repo-original" "$REPO_BASE/$owner/$repo/$repo-cregit"
    cd "$REPO_BASE/$target"

    mkdir -p "$REPO_BASE/$owner/$repo/memo"
    mkdir -p "$REPO_BASE/$owner/$repo/blame"

    local repo_cregit="$REPO_BASE/$owner/$repo/$repo-cregit"
    local repo_original="$REPO_BASE/$owner/$repo/$repo-original"

    echo "--- Step1 ---"
    cd /opt/bfg-repo-cleaner
    java -jar bfg/target/bfg-1.12.16-SNAPSHOT-blobexec-fbf55a1.jar '--blob-exec:/workspaces/tools/cregit/tokenizeByBlobId/tokenBySha.pl=\.java$' --no-blob-protection "$repo_cregit"
    cd "$repo_cregit"
    git reset --hard HEAD

    echo "--- Step2 ---"
    cd /workspaces/tools/cregit
    java -jar slickGitLog/target/scala-2.10/slickgitlog_2.10-0.1-SNAPSHOT-one-jar.jar "$repo_original.db" "$repo_original"

    echo "--- Step3 ---"
    cd /workspaces/tools/cregit
    java -jar slickGitLog/target/scala-2.10/slickgitlog_2.10-0.1-SNAPSHOT-one-jar.jar "$repo_cregit.db" "$repo_cregit"

    echo "--- Step4 ---"
    cd /workspaces/tools/cregit
    java -jar remapCommits/target/scala-2.10/remapcommits_2.10-0.1-SNAPSHOT-one-jar.jar "$repo_cregit.db" "$repo_cregit"

    mkdir -p /workspaces/dataset/pyszz_v2/cloned/defects4j/original/"$owner"/
    mkdir -p /workspaces/dataset/pyszz_v2/cloned/defects4j/1token/"$owner"/

    cp -r "$repo_original" "/workspaces/dataset/pyszz_v2/cloned/defects4j/original/$owner/$repo"
    cp -r "$repo_cregit" "/workspaces/dataset/pyszz_v2/cloned/defects4j/1token/$owner/$repo"

    mkdir -p /workspaces/dataset/databases/defects4j/1token/"$owner"/"$repo"
    cp -r "$repo_cregit.db" "/workspaces/dataset/databases/defects4j/1token/$owner/$repo/"

    rm -rf "$REPO_BASE/$owner/$repo"
}

# CSVファイルの読み込みと処理
cat /workspaces/dataset/preparation/analyzed_defects4j_projects.csv | while read -r line; do
    wrap_cregit "$line"
done

rm -rf /workspaces/dataset/repositories/defects4j/1token_github.com

echo "All done!"
