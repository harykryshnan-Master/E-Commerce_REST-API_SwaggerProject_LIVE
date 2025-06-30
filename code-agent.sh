#!/bin/bash
# Update packages
sudo apt-get update -y
# Install dependencies
sudo apt-get install -y ruby wget
# Download the CodeDeploy agent installer (replace region if needed)
cd /home/ubuntu
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
# Make installer executable
chmod +x ./install
# Run the installer
sudo ./install auto
# Start the CodeDeploy agent service
sudo systemctl start codedeploy-agent
# Enable the service to start on boot
sudo systemctl enable codedeploy-agent
# Check the agent status
sudo systemctl status codedeploy-agent
