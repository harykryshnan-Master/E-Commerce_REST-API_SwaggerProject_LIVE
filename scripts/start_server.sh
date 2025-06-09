#!/bin/bash

echo "=== Starting application ==="

# Load environment variables
if [ -f /home/ubuntu/deployments/.env ]; then
  set -o allexport
  source /home/ubuntu/deployments/.env
  set +o allexport
fi

# Log env variables to verify
{
  echo "DOMAIN=$DOMAIN"
  echo "MYSQLHOST=$MYSQLHOST"
  echo "MYSQL_DATABASE=$MYSQL_DATABASE"
  echo "MYSQLUSER=$MYSQLUSER"
  echo "MYSQLPASSWORD=$MYSQLPASSWORD"
} | sudo tee -a /home/ubuntu/deployments/env-check.log

# Start Spring Boot WAR (embedded Tomcat)
if [ -f /home/ubuntu/deployments/ROOT.war ]; then
  nohup java -jar /home/ubuntu/deployments/ROOT.war > /home/ubuntu/deployments/app.log 2>&1 &
  echo $! > /home/ubuntu/deployments/app.pid
  echo "Application started with PID $(cat /home/ubuntu/deployments/app.pid)"
else
  echo "WAR file not found. Deployment failed."
  exit 1
fi
