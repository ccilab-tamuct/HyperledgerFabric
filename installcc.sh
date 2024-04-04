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

# Package the chaincode
peer lifecycle chaincode package basic.tar.gz --path ../asset-transfer-basic/chaincode-javascript --lang node --label basic_1.0

# Initialize ORG1 env variables and install chaincode
export CORE_PEER_TLS_ENABLED=true
source /home/tamuct/HLF/org1Env.txt
peer lifecycle chaincode install basic.tar.gz

# Initialize ORG2 env variables and install chaincode
source /home/tamuct/HLF/org2Env.txt
peer lifecycle chaincode install basic.tar.gz

export CC_PACKAGE_ID=$(peer lifecycle chaincode queryinstalled | grep -o 'basic_1.0:.*' | cut -d ',' -f 1)
echo "$CC_PACKAGE_ID"
peer lifecycle chaincode approveformyorg -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID mychannel --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# Org1 Peer env vars
source /home/tamuct/HLF/org1Env.txt
peer lifecycle chaincode approveformyorg -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID mychannel --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# Check if both organization peers approved
peer lifecycle chaincode checkcommitreadiness --channelID mychannel --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --output json

# Commit chaincode to the channel
peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID mychannel --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt"

# Confirm that the chaincode is committed
peer lifecycle chaincode querycommitted --channelID mychannel --name basic

