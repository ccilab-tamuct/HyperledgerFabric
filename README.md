# HyperledgerFabric

This document is a step-by-step guide on installing Hyperledger Fabric. It will be a guide to installing the dependencies and initializing the test-network described in the official documentation.

Required software:
1. Ubuntu (latest version)
2. Visual Studio Code (latest version)


* Open the terminal.
* Create a new directory called "HLF". This will be the main directory to run Hyperledger Fabric chaincode and applications.
  ```
  mkdir HLF
  ```
* Grant sudo permissions to current user.
  ```
  su - root
  sudo usermod -aG sudo <username>
  su - <username>
  ```
* Create a new droplet. Use en_US.UTF-8.
  ```
  sudo dpkg-reconfigure locales
  ```
* Update and upgrade system.
  ```
  sudo apt-get update && sudo apt-get upgrade
  ```
  
* Navigate back to HLF folder.
  ```
  cd HLF
  ```
* Install git, curl, and docker.
  ```
  sudo apt-get install git curl docker-compose -y
  ```
* Start the docker daemon.
  ```
  sudo systemctl start docker
  sudo systemctl enable docker
  ```
* Add current user to docker group.
  ```
  sudo usermod -aG docker <username>
  ```
* Check docker versions
  ```
  docker --version
  docker-compose -version
  ```
* Download and install Golang.
  ```
  wget https://dl.google.com/go/go1.22.1.linux-amd64.tar.gz
  tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz
  ```
* Add /usr/local/go/bin to the PATH environment variable.
  ```
  export PATH=$PATH:/usr/local/go/bin
  ```
* Check Go version.
  ```
  go version
  ```
* Download the fabric install script.
  ```
  curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh && chmod +x install-fabric.sh
  ```
* Pull docker containers, binaries, and samples from the official repository.
  ```
  ./install-fabric.sh docker samples binary
  ```
