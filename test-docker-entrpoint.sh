#!/bin/sh
set -echo
echo "ENVIRONMENT: $RAILS_ENV"

bundle check || bundle install

bundle exec ${@}