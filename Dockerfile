# Use the Arch Linux image
FROM archlinux:latest

# Update the system and install Samba
RUN pacman -Syu --noconfirm samba

# Copy the smb.conf file from your host to the container
COPY smb.conf /etc/samba/smb.conf

# Copy the user setup script to the Docker image
COPY user_setup.sh /usr/local/bin/

# Copy the start script to the Docker image
COPY start.sh /usr/local/bin/

# Run the start script when the container starts
CMD ["/usr/local/bin/start.sh"]

# Expose the Samba ports
EXPOSE 137/udp 138/udp 139 445
