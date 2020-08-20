#!/bin/bash

(bundle check || bundle install) && (yarn install --check-files || yarn install)
