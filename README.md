# Deploy ERC-721 Token with HardHat

This repository contains a basic ERC-721 token contract created using [OpenZeppelin's Token Contract Wizard](https://docs.openzeppelin.com/contracts/4.x/wizard), and then compiled, tested and deployed with HardHat.

## Requirements

NodeJS/NPM: https://nodejs.org/

HardHat: https://hardhat.org/

Create a .env file with the following information:

```
rpcUrl=
privateKey=
```

## Instructions

### First clone this repository.

```
$ git clone https://github.com/MubashirAlam89/Deploy-Erc20-Token-BSC-Testnet-Using-Hardhat.git
```

### Install dependencies. Make sure you already have nodejs & npm installed in your system.

```
$ npm install
```

### Some Helpful Command

1. npx hardhat complie to compile soldiity files.
2. npx hardhat test for run test.
3. Run npx hardhat run scripts/deploy.js --network bscTestnet to deploy the token.

## Deployment

[FlowersNftCollection(FNft)](https://testnet.bscscan.com/address/0x6E184cC2BED07C1485773c6f9A38e6763c54b885) deployed on bsc Test network.

TokenAddress: 0x6E184cC2BED07C1485773c6f9A38e6763c54b885
