#!/bin/bash
# Add samba group if it doesn't exist
if ! getent group sambashare > /dev/null; then
    groupadd -r sambashare
fi

# Add samba user
useradd -M -s /bin/false -G sambashare ${SAMBA_USER}
echo -e "${SAMBA_PASSWORD}\n${SAMBA_PASSWORD}" | smbpasswd -a -s ${SAMBA_USER}
