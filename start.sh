#!/bin/bash
# Run the user setup script
/usr/local/bin/user_setup.sh
# Start the Samba service
smbd -D -s /etc/samba/smb.conf
# Tail the log file
tail -f /var/log/samba/log.smbd
