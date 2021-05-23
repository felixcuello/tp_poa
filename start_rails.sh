#!/usr/bin/env bash

rm -f /app/tmp/pids/server.pid

bundle exec rails server -b 0.0.0.0 -p 3000
