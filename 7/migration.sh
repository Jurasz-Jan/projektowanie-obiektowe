#!/bin/bash
set -e

echo "Running Fluent migrations..."

./app-executable migrate --yes
echo "Migrations complete."

echo "Verifying resource paths..."
ls -lR /app/Resources

exec ./app-executable "$@"