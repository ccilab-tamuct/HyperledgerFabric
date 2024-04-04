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

export CORE_PEER_TLS_ENABLED=true
source /home/tamuct/HLF/org1Env.txt

#peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"CreateAsset","Args":[]}'
peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'