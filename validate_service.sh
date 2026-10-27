#!/bin/bash
set -e
systemctl is-active --quiet ec2-auto-deploy
curl --fail --silent http://127.0.0.1:8000/health
echo
