#!/bin/bash
# ./sql                         → PostgreSQL に入って対話で打つ (\q で抜ける)
# ./sql lessons/1-1/answer.sql  → ファイルの SQL を上から順に実行して結果を表で出す
cd "$(dirname "$0")"
if [ -n "$1" ]; then
  docker compose exec -T db psql -X -U learner -d shop --echo-queries < "$1"
else
  docker compose exec db psql -U learner -d shop
fi
