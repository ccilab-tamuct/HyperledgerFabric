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
10. Download the fabric installation script
```
curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh && chmod +x install-fabric.sh
```
11. Pull the docker containers, binaries, and samples from repository
```
./install-fabric.sh docker samples binary
```
12. Open the HLF folder. Press CTRL+K and then CTRL+O. Select the HLF folder in the Home directory.
13. Select "Yes, I trust the authors"
14. The fabric-samples directory has a test-network folder that can be used to test smart contracts (chaincode). The test-network brings up two peer organizations and an orderer organization. Each peer organization has one peer each.
15. Navigate to the test-network folder
```
cd fabric-samples/test-network
```
16. Use the network.sh script to bring up the network.
```
./network.sh down
./network.sh up createChannel -ca
```
17. Check the components of the network
```
docker ps -a
```
18. Once the channel has been created, deploy a sample JavaScript chaincode to the network. Dependencies must be installed first.
```
cd ../asset-transfer-basic/chaincode-javascript
sudo apt-get install npm
npm install
```
```
./network.sh deployCC -ccn basic -ccp .../asset-transfer-basic/chaincode-javascript -ccl javascript
```
19. After deploying the chaincode, use the "peer" CLI to interact with the network by adding the "peer" binary to the CLI path.
```
export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=$PWD/../config/
```

