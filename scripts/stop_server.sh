#!/bin/bash

echo "=== Stopping existing application (if running) ==="

if [ -f /home/ubuntu/deployments/app.pid ]; then
  PID=$(cat /home/ubuntu/deployments/app.pid)
  if ps -p $PID > /dev/null; then
    echo "Killing existing application process $PID"
    kill -9 $PID
  fi
  rm -f /home/ubuntu/deployments/app.pid
else
  echo "No existing application running."
fi

