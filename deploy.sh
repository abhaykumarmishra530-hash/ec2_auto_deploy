#!/bin/bash
set -e

# Run on the EC2 instance from the application directory.
APP_DIR="/home/ubuntu/ec2-auto-deploy"

if [ ! -d "$APP_DIR" ]; then
  echo "Application directory not found: $APP_DIR"
  exit 1
fi

bash "$APP_DIR/scripts/install_dependencies.sh"
bash "$APP_DIR/scripts/start_server.sh"
echo "Application deployment completed."
