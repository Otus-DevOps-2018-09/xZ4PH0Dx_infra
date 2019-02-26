[Unit]
Description=Puma HTTP Server
After=network.target

[Service]
Type=simple
User=appuser
WorkingDirectory=/home/appuser/reddit
ExecStart=/bin/bash -lc 'puma'
Environment=DATABASE_URL=${mongodb_internal}
Restart=always

[Install]
WantedBy=multi-user.target

