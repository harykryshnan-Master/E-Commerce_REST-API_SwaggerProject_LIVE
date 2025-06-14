#!/bin/bash

echo "=== Starting application ==="

# Load env variables from Parameter Store
export DOMAIN=$(aws ssm get-parameter --name "/ecomapp/DOMAIN" --with-decryption --query "Parameter.Value" --output text)
export MYSQLHOST=$(aws ssm get-parameter --name "/ecomapp/MYSQLHOST" --with-decryption --query "Parameter.Value" --output text)
export MYSQL_DATABASE=$(aws ssm get-parameter --name "/ecomapp/MYSQL_DATABASE" --with-decryption --query "Parameter.Value" --output text)
export MYSQLUSER=$(aws ssm get-parameter --name "/ecomapp/MYSQLUSER" --with-decryption --query "Parameter.Value" --output text)
export MYSQLPASSWORD=$(aws ssm get-parameter --name "/ecomapp/MYSQLPASSWORD" --with-decryption --query "Parameter.Value" --output text)

echo $DOMAIN
echo $MYSQLHOST
echo $MYSQL_DATABASE
echo $MYSQLUSER
echo $MYSQLPASSWORD

echo "Environment variables loaded."

if [ -f /home/ubuntu/deployments/ROOT.war ]; then
  nohup java -jar /home/ubuntu/deployments/ROOT.war > /home/ubuntu/deployments/app.log 2>&1 &
  echo $! > /home/ubuntu/deployments/app.pid
  echo "Application started with PID $(cat /home/ubuntu/deployments/app.pid)"
else
  echo "WAR file not found. Deployment failed."
  exit 1
fi
