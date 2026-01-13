#!/usr/bin/env bash
# エラーが発生したら即座に終了
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# データベースのマイグレーション
bundle exec rails db:migrate
bundle exec rails db:seed
