#!/bin/bash

echo "=== Starting application ==="

# Source environment variables from .env file if exists
if [ -f /home/ubuntu/deployments/.env ]; then
  echo "Loading environment variables from .env"
  export $(cat /home/ubuntu/deployments/.env | xargs)
else
  echo ".env file not found, proceeding without env vars."
fi

if [ -f /home/ubuntu/deployments/ROOT.war ]; then
  nohup java -jar /home/ubuntu/deployments/ROOT.war > /home/ubuntu/deployments/app.log 2>&1 &
  echo $! > /home/ubuntu/deployments/app.pid
  echo "Application started with PID $(cat /home/ubuntu/deployments/app.pid)"
else
  echo "WAR file not found. Deployment failed."
  exit 1
fi
