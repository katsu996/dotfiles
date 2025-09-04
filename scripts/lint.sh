#!/bin/bash

set -u

files=(
    scripts/init.sh
    scripts/install.sh
    scripts/lint.sh
)
for file in "${files[@]}"
do
    shellcheck "${file}"
done