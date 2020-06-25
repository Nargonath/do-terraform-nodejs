#!/bin/bash

# inspired by: https://www.digitalocean.com/docs/droplets/tutorials/recommended-setup/

USERNAMES=('user1' 'user2')

for username in "${USERNAMES[@]}"
do

  # Create users and immediately expire password to force a change on login
  useradd --create-home --shell "/bin/bash" --groups sudo "${username}"
  passwd --delete "${username}"
  chage --lastday 0 "${username}"

  # Create ssh directory for sudo user and move keys over
  home_directory="$(eval echo ~${username})"
  mkdir --parents "${home_directory}/.ssh"
  grep "${username}" /root/.ssh/authorized_keys > "${home_directory}/.ssh/authorized_keys"
  chmod 0700 "${home_directory}/.ssh"
  chmod 0600 "${home_directory}/.ssh/authorized_keys"
  chown --recursive "${username}":"${username}" "${home_directory}/.ssh"

done

# Disable root SSH login with password
sed --in-place 's/^PermitRootLogin.*/PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config
if sshd -t -q; then systemctl restart sshd fi