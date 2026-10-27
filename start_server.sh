#!/bin/bash
set -e
APP_DIR="/home/ubuntu/ec2-auto-deploy"

cat > /etc/systemd/system/ec2-auto-deploy.service <<EOF
[Unit]
Description=EC2 Auto Deploy Flask Application
After=network.target

[Service]
Type=simple
WorkingDirectory=$APP_DIR
ExecStart=$APP_DIR/venv/bin/gunicorn --workers 2 --bind 0.0.0.0:8000 app:app
Restart=always
RestartSec=5
User=root

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable ec2-auto-deploy
systemctl restart ec2-auto-deploy
