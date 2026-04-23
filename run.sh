#!/bin/bash
# Start local PHP development server

PORT=3000
DOMAIN="autoindex.localhost"

echo "Starting PHP dev server on http://localhost:${PORT}"
echo ""
echo "To use http://${DOMAIN}:${PORT} locally, add this line to /etc/hosts:"
echo "127.0.0.1 ${DOMAIN}"
echo ""
php -d display_errors=1 -d error_reporting=E_ALL -S localhost:${PORT} &
PID=$!
echo "Server running in background (PID: ${PID})"
echo "Errors will appear in this console"
echo "Stop with: kill ${PID}"
