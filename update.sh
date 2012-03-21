#!/usr/bin/env bash

cd `dirname $0`
echo Clearing and updating remote submodules...
rm -rfv `git submodule | cut -f 3 --delimiter " "`
git submodule update --init --recursive
