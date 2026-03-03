#!/usr/bin/env bash
# Script de build para Render.com
# https://render.com/docs/deploy-rails
set -o errexit

echo "=== Ruby version ==="
ruby -v

echo "=== Bundle install ==="
bundle config set --local deployment 'true'
bundle config set --local without 'development test'
bundle install --jobs 4 --retry 3

echo "=== Asset precompile ==="
bundle exec rails assets:precompile
bundle exec rails assets:clean

echo "=== Database migrate ==="
bundle exec rails db:migrate

echo "=== Confirm all users (Free Tier bypass) ==="
bundle exec rake users:confirm_all

echo "=== Build completado exitosamente ==="
