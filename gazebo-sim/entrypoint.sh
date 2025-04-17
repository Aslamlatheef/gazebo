#!/bin/bash
set -e
source /opt/ros/noetic/setup.bash

echo "[entrypoint] Starting gzserver..."
gzserver --verbose &

echo "[entrypoint] Starting gzweb..."
cd /home/rosuser/gzweb
npm start
