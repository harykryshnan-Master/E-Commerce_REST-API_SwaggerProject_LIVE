#!/bin/bash

echo "=== Starting application ==="

# Load env variables from Parameter Store
DOMAIN=$(aws ssm get-parameter --name "/ecomapp/DOMAIN" --with-decryption --query "Parameter.Value" --output text)
MYSQLHOST=$(aws ssm get-parameter --name "/ecomapp/MYSQLHOST" --with-decryption --query "Parameter.Value" --output text)
MYSQL_DATABASE=$(aws ssm get-parameter --name "/ecomapp/MYSQL_DATABASE" --with-decryption --query "Parameter.Value" --output text)
MYSQLUSER=$(aws ssm get-parameter --name "/ecomapp/MYSQLUSER" --with-decryption --query "Parameter.Value" --output text)
MYSQLPASSWORD=$(aws ssm get-parameter --name "/ecomapp/MYSQLPASSWORD" --with-decryption --query "Parameter.Value" --output text)

echo "Environment variables loaded."

if [ -f /home/ubuntu/deployments/ROOT.war ]; then
  nohup java -jar /home/ubuntu/deployments/ROOT.war > /home/ubuntu/deployments/app.log 2>&1 &
  echo $! > /home/ubuntu/deployments/app.pid
  echo "Application started with PID $(cat /home/ubuntu/deployments/app.pid)"
else
  echo "WAR file not found. Deployment failed."
  exit 1
fi
