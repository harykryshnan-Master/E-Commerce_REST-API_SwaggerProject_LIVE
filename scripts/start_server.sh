
#!/bin/bash

echo "=== Starting application ==="

if [ -f /home/ubuntu/deployments/ROOT.war ]; then
  nohup java -jar /home/ubuntu/deployments/ROOT.war > /home/ubuntu/deployments/app.log 2>&1 &
  echo $! > /home/ubuntu/deployments/app.pid
  echo "Application started with PID $(cat /home/ubuntu/deployments/app.pid)"
else
  echo "WAR file not found. Deployment failed."
  exit 1
fi
