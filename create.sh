#!/usr/bin/env bash

# Navigate to test-network folder
cd fabric-samples/test-network

# Initialize peer CLI env variables
PEERCLI_PATH=/home/tamuct/HLF/peercli.txt
if [ -f "$PEERCLI_PATH" ]; then
    source "$PEERCLI_PATH"
else
    echo "Error: peer CLI environment variable file '$PEERCLI_PATH' not found."
    exit 1
fi

# Bring up the network
./network.sh down
./network.sh up createChannel

# Install JavaScript dependencies
cd ../asset-transfer-basic/chaincode-javascript
sudo apt-get install npm
npm install
cd ../../test-network