# HyperledgerFabric

This document is a step-by-step guide on installing Hyperledger Fabric. It will be a guide to installing the dependencies and initializing the test-network described in the official documentation.

Required software:
* Ubuntu (latest version)
* Visual Studio Code (latest version)

1. Open Visual Studio Code
2. Press CTRL+SHIFT+` to open a new terminal
3. Give sudo permissions to current user:
```
su - root
sudo usermod -aG sudo <username>
su - <username>
```
4. Create a new directory to work with Hyperledger Fabric
```
mkdir HLF
```
5. Navigate into the HLF directory
```
cd HLF
```
6. Install git, curl, and docker
```
sudo apt-get install git curl docker-compose -y
```
7. Start the docker daemon
```
sudo systemctl start docker
sudo systemctl enable docker
```
8. Add current user to the docker group
```
sudo usermod -a -G docker <username>
```
9. Check docker versions
```
docker --version
docker-compose -version
```
