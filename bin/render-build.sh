#!/usr/bin/env bash
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# 全てのテーブルを Supabase 上に作成
bundle exec rails db:migrate

# デモユーザー作成
bundle exec rails db:seed
