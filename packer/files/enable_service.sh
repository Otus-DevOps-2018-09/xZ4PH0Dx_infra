#!/bin/bash
echo '[Unit]
Description=Puma HTTP Server
Requires=mongod.service
After=network.target

[Service]
User=appuser
Type=simple
WorkingDirectory=/home/appuser/reddit
ExecStart=/usr/local/bin/puma -b tcp://0.0.0.0:9292

[Install]
WantedBy=multi-user.target
' > /etc/systemd/system/reddit-app.service
systemctl enable reddit-app
