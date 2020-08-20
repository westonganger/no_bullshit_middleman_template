#!/bin/bash

./setup.sh && bundle exec middleman deploy && bundle exec middleman sitemap_ping
