#!/bin/bash
set -euo pipefail
cp /certs/server.crt /var/lib/postgresql/server.crt
cp /certs/server.key /var/lib/postgresql/server.key
chown postgres:postgres /var/lib/postgresql/server.crt /var/lib/postgresql/server.key
chmod 600 /var/lib/postgresql/server.key

exec docker-entrypoint.sh "$@"