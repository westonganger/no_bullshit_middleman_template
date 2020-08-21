#!/bin/bash

### https://stackoverflow.com/a/24112741/3068360
script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $script_path

bundle install --path vendor/cache && yarn install
