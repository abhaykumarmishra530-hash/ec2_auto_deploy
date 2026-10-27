#!/bin/bash
# Do not fail the first deployment if the service does not exist yet.
if systemctl list-unit-files | grep -q '^ec2-auto-deploy.service'; then
  systemctl stop ec2-auto-deploy || true
fi
exit 0
