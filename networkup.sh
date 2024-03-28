#!/bin/bash

# Initialize testt network
cd fabric-samples/test-network
./network.sh down
./network.sh up createChannel -ca


# Install NodeJS deppendencies
cd ../asset-transfer-basic/chaincode-javascript
sudo apt-get install npm
npm install
cd ../../test-network

# Set peer CLI
export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=$PWD/../config/
peer version