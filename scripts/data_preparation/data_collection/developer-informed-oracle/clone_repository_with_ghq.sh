#!/bin/bash

set -eu

REPOSITORY_LIST_PATH=$1
CLONED_REPOSITORY_ROOT_PATH="/workspaces/dataset/repositories/developer-informed-oracle"

mkdir -p $CLONED_REPOSITORY_ROOT_PATH

git config --global ghq.root '/workspaces/dataset/repositories/developer-informed-oracle'
ghq get --no-recursive --parallel < $REPOSITORY_LIST_PATH

echo "$(wc -l < $REPOSITORY_LIST_PATH) repositories have been cloned."
