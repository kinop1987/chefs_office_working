#!/bin/bash
set -e

rm -f /chefs_office_working/tmp/pids/server.pid

exec "$@"