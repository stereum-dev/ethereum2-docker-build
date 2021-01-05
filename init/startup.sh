#!/bin/bash -e

echo "Setting permissions of /mnt/* to ${SERVICE_USER}"
chown -R "${SERVICE_USER}":"${SERVICE_USER}" /mnt
exit 0