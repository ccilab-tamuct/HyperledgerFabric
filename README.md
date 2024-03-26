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
* Open VS Code.
* Navigate to the HLF directory by opening the folder in VS Code. Press CTRL+K, then CTRL+O. Select the HLF folder in the Home directory.
* Select "Yes, I trust the authors."
* Press CTRL+SHIFT+` to open a new terminal.
* Grant sudo permissions to current user.
  ```
  su - root
  sudo usermod -aG sudo <username>
  su - <username>
  ```
* Navigate back to HLF folder.
  ```
  cd HLF
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
* Add current user to docker group.
  ```
  sudo usermod -aG docker <username>
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
