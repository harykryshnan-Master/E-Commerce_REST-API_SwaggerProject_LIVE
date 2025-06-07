#!/bin/bash

echo "=== Installing required packages ==="
apt-get update -y
apt-get install -y openjdk-17-jdk unzip tomcat10

echo "=== Creating deployment directory if not exists ==="
mkdir -p /home/ubuntu/deployments/

echo "=== Cleaning old WAR files ==="
rm -rf /home/ubuntu/deployments/ROOT.war

echo "Dependencies installed and old WAR removed."

