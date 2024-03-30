# Setup Instructions

Follow these steps to set up the environment:

1. Add a new user named `ansible`:
    ```bash
    sudo adduser ansible
    ```

2. Add `ansible` to the `sudo` group:
    ```bash
    sudo usermod -aG sudo ansible
    ```

3. Add `ansible` to the `docker` group:
    ```bash
    sudo usermod -aG docker ansible
    ```

4. Open the sudoers file:
    ```bash
    sudo visudo
    ```
    Then add the following line to allow `ansible` to run sudo commands without a password:
    ```
    ansible ALL=(ALL) NOPASSWD:ALL
    ```

5. Generate an SSH key pair:
    ```bash
    ssh-keygen -t rsa -b 4096
    ```

6. Copy the public key to the remote server:
    ```bash
    ssh-copy-id -i ~/.ssh/id_rsa.pub ansible@192.168.0.7
    ```

7. Install the Docker Buildx plugin:
    ```bash
    sudo nala install docker-buildx
    ```

8. Open the Docker configuration file:
    ```bash
    sudo nano /etc/docker/daemon.json
    ```
    Then add the following content to enable BuildKit:
    ```json
    {
      "features": {
        "buildkit": true
      }
    }
    ```

9. Restart the Docker service:
    ```bash
    sudo systemctl restart docker
    ```
