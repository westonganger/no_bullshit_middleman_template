#!/bin/bash

### https://stackoverflow.com/a/24112741/3068360
script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $script_path

(bundle check || bundle install) && bundle exec middleman deploy && bundle exec middleman sitemap_ping
