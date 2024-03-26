# HyperledgerFabric

## This document is a step-by-step guide on installing Hyperledger Fabric. It will be a guide to installing the dependencies and initializing the test-network described in the official documentation.

## Required software:
1. Ubuntu (latest version)
2. Visual Studio Code (latest version)

## Install Hyperledger Fabric
* Open the terminal.
* Create a new directory called "HLF". This will be the main directory to run Hyperledger Fabric chaincode and applications.
  ```
  mkdir HLF
  ```
* Grant sudo permissions to current user.
  ```
  su - root
  sudo usermod -a -G sudo <username>
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
  sudo usermod -a -G docker <username>
  ```
* Check docker versions
  ```
  docker --version
  docker-compose -version
  ```
* Download and install Golang.
  ```
  wget https://dl.google.com/go/go1.22.1.linux-amd64.tar.gz
  tar -xzvf go1.22.1.linux-amd64.tar.gz
  sudo mv go/ /usr/local
  ```
* Add /usr/local/go/bin to the PATH environment variable.
  ```
  export GOPATH=/usr/local/go
  export PATH=$PATH:/usr/local/go/bin
  ```
* Check Go version.
  ```
  go version
  ```
* Download and install JQuery (necessary for following the documentation tutorials)
  ```
  sudo apt-get install jq
  ```
* Exit and relog in
  ```
  exit
  su - <username>
  ```
* Navigate to the HLF folder.
  ```
  cd HLF
  ```
* Download the fabric install script.
  ```
  curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh && chmod +x install-fabric.sh
  ```
* Restart the terminal and navigate back to HLF directory.
* Pull docker containers, binaries, and samples from the official repository.
  ```
  ./install-fabric.sh docker samples binary
  ```
The Hyperledger Fabric "fabric-samples" folder should be inside the HLF directory. The fabric-samples folder contains a sample network as well as sample chaincodes and applications.
* Exit and close the terminal.
  ```
  exit
  ```
## Bring up the test network.
* Restart the system (for some reason the sudo permissions and docker permissions are lost when using the terminal in VS Code, but restarting seemed to fix the issue).
* Open Visual Studio Code
* Press CTRL+K, then CTRL+O and open the HLF folder from the Home directory.
* Select "Yes, I trust the authors" if prompted.
* Press CTRL+Shift+` to open a new terminal in VS Code.
* Navigate to the test-network folder.
  ```
  cd fabric-samples/test-network
  ```
The network.sh file is the main file to run most of the sample files provided.
* Bring down any previous networks.
  ```
  ./network.sh down
  ```
* Bring up the network.
  ```
  ./network.sh up
  ```
* Check the docker containers created.
  ```
  docker ps -a
  ```
  
## Deploy sample chaincode to the test network
Now that the test network is confirmed to work, the next step is to deploy a sample chaincode (smart contract) in the network.
* Bring down the previous network and bring up a new one.
  ```
  ./network.sh down
  ./network.sh up
  ```
The fabric-samples provide sample chaincodes written in Go, JavaScript, Java, and TypeScript. This guide will be using the JavaScript chaincode.
Smart contracts need to be packaged and installed on peers before they can be queried and invoked.
* Navigate to the sample JS chaincode.
  ```
  cd ../asset-transfer-basic/chaincode-javascript
  ```
