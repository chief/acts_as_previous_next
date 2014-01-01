#!/usr/bin/env sh

cd spec/dummy
bundle exec rake db:create RAILS_ENV=test
bundle exec rake db:schema:load RAILS_ENV=test
bundle exec rake db:test:prepare