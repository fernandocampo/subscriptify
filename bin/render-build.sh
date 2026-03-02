#!/usr/bin/env bash
# Script de build para Render.com
# https://render.com/docs/deploy-rails
set -o errexit

echo "=== Ruby version ==="
ruby -v

echo "=== Instalando wkhtmltopdf para generación de PDFs ==="
if ! command -v wkhtmltopdf &> /dev/null; then
    apt-get update -qq
    apt-get install -y wkhtmltopdf --no-install-recommends
    rm -rf /var/lib/apt/lists/*
fi
echo "wkhtmltopdf instalado en: $(which wkhtmltopdf)"

echo "=== Bundle install ==="
bundle config set --local deployment 'true'
bundle config set --local without 'development test'
bundle install --jobs 4 --retry 3

echo "=== Asset precompile ==="
bundle exec rails assets:precompile
bundle exec rails assets:clean

echo "=== Database migrate ==="
# En free tier no hay pre-deploy command, migraciones van aquí
bundle exec rails db:migrate

echo "=== Build completado exitosamente ==="
