#!/bin/bash
set -e

# Wait for Postgres to become available
until pg_isready -h postgres -p 5435 -U "$POSTGRES_USER"
do
  echo "Waiting for postgres..."
  sleep 2
done

echo "Postgres is available"

# Run database setup commands
/app/bin/soloroute_public eval "SoloroutePublic.Release.migrate"

# Start the application
exec /app/bin/server