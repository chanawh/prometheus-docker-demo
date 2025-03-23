#!/bin/sh
# Explicitly define the PATH to ensure commands are found
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Check if htop is installed
if command -v htop >/dev/null 2>&1; then
    echo "htop is installed"
else
    echo "htop is not installed"
    exit 1
fi

# Check if the container can reach the service on localhost:8080
curl --silent --fail http://localhost:8080 || exit 1

# If both checks pass, exit with a 0 status (healthy)
exit 0
