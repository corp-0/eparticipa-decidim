#!/bin/sh
set -e

# runs db:drop, db:create and db:migrate.
# We can't use db:schema:load because we don't have the db/schema.rb
# file when we create the app for the first time and migrations haven't
# been run yet.
bundle exec rake db:migrate:reset

bundle exec rails decidim_initiatives:install:migrations
bundle exec rails decidim_consultations:install:migrations
bundle exec rails decidim_conferences:install:migrations
bundle exec rails decidim_templates:install:migrations

bundle exec rails db:migrate

# Adds basic system, admin and user accounts, and lorem ipsum content.
bundle exec rake db:seed

exec "$@"
