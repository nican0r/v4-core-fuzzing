# Uniswap v4 Core Fuzzing

This fuzzing setup allows testing the `PoolManager` contract for a given `Hook` contract, in this case a modified version of the `Counter` hook defined by [this](https://github.com/uniswapfoundation/v4-template) template is used. 

The system setup uses the `Deployers` contract from the UniV4 test suite to deploy the Uniswap system with a single ERC20/ERC20 pool whose id is stored in the `poolId` variable. 

As a proof-of-concept, the current setup only exposes a target function for the `swap` function. Because all operations in the `PoolManager` contract are made through the `unlock` function, for simplicity, the existing `swap` function from the UniV4 test suite defined in `Deployers` is used in the `PoolManagerTargets::poolManager_swap` function as it already applies some clamping.

The `Counter` hook has been modified so that it stores a `swapValue` as an example of state changes that may occur in the called contract. 

An example property has been defined on `poolManager_swap` which checks if the hook has not modified the `amountSpecified` in the swap.  

## Usage

This fuzzing suite has been scaffolded with Recon using the Chimera framework. 

### Install

After cloning, install dependencies using Foundry. 

```
forge install
```

### Fuzzing
To fuzz with Echidna use the following command:

```
echidna . --contract CryticTester --config echidna.yaml
```

This repo doesn't currently support fuzzing with Medusa because it uses the `deployBytecodes` config that's unavailable in Medusa.