
sudo adduser ansible
sudo usermod -aG sudo ansible
sudo usermod -aG docker ansible
sudo visudo
ansible ALL=(ALL) NOPASSWD:ALL
ssh-keygen -t rsa -b 4096
ssh-copy-id -i ~/.ssh/id_rsa.pub ansible@192.168.0.7
sudo nala install docker-buildx
sudo nano /etc/docker/daemon.json
 --------------------------------                                                                                                       
{  "features": {
    "buildkit": true
  }
}
--------------------------------
sudo systemctl restart docker
