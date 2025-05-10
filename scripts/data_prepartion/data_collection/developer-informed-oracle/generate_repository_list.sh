#!/bin/bash

set -eu

ANALYZED_PROJECTS_CSV_PATH=$1
OUTPUT_PATH="repository_list.txt"

if [ -e $OUTPUT_PATH ]; then
    rm $OUTPUT_PATH
fi

function wrap_generate_repository_list() {
    local line=$1
    local target=($(echo $line | cut -d ',' -f 1))
    echo $target >> $OUTPUT_PATH
}

cat $ANALYZED_PROJECTS_CSV_PATH | while read -r line; do
    wrap_generate_repository_list $line
done

echo "Generated repository list: $OUTPUT_PATH"
