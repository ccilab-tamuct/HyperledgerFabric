# HyperledgerFabric

This document is a step-by-step guide on installing Hyperledger Fabric. It will be a guide to installing the dependencies and initializing the test-network described in the official documentation.

Required software:
* Ubuntu (latest version)
* Visual Studio Code (latest version)

* Open Visual Studio Code
* Press CTRL+SHIFT+` to open a new terminal
* Create a new directory called "HLF". This will be the main directory to run Hyperledger Fabric chaincode and applications.
  ```
  mkdir HLF
  ```
* Navigate to the HLF directory.
  ```
  cd HLF
  ```
* Grant sudo permissions to current user.
  ```
  su - root
  sudo usermod -aG sudo <username>
  su - <username>
  ```
* Update and upgrade apt-get
  ```
  sudo apt-get update && sudo apt-get upgrade
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
* Check docker versions
  ```
  docker --version
  docker-compose -version
  ```
* Download the fabric install script.
  ```
  curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh && chmod +x install-fabric.sh
  ```
* Pull docker containers, binaries, and samples from the official repository.
  ```
  ./install-fabric.sh docker samples binary
  ```
* 

