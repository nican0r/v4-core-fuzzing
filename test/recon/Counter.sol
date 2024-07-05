// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {BaseHook} from "v4-periphery/BaseHook.sol";

import {Hooks} from "src/libraries/Hooks.sol";
import {IPoolManager} from "src/interfaces/IPoolManager.sol";
import {PoolKey} from "src/types/PoolKey.sol";
import {PoolId, PoolIdLibrary} from "src/types/PoolId.sol";
import {BalanceDelta} from "src/types/BalanceDelta.sol";
import {BeforeSwapDelta, BeforeSwapDeltaLibrary} from "src/types/BeforeSwapDelta.sol";

contract Counter {
    using PoolIdLibrary for PoolKey;

    // NOTE: ---------------------------------------------------------
    // state variables should typically be unique to a pool
    // a single hook contract should be able to service multiple pools
    // ---------------------------------------------------------------

    mapping(PoolId => uint256 count) public beforeSwapCount;
    mapping(PoolId => uint256 count) public afterSwapCount;
    mapping(PoolId => int256 value) public beforeSwapValue;
    mapping(PoolId => int256 value) public afterSwapValue;

    mapping(PoolId => uint256 count) public beforeAddLiquidityCount;
    mapping(PoolId => uint256 count) public beforeRemoveLiquidityCount;
    mapping(PoolId => int256 value) public beforeAddLiquidityValue;
    mapping(PoolId => int256 value) public beforeRemoveLiquidityValue;

    constructor(IPoolManager _poolManager) {}

    function getHookPermissions() public pure returns (Hooks.Permissions memory) {
        return
            Hooks.Permissions({
                beforeInitialize: false,
                afterInitialize: false,
                beforeAddLiquidity: true,
                afterAddLiquidity: false,
                beforeRemoveLiquidity: true,
                afterRemoveLiquidity: false,
                beforeSwap: true,
                afterSwap: true,
                beforeDonate: false,
                afterDonate: false,
                beforeSwapReturnDelta: false,
                afterSwapReturnDelta: false,
                afterAddLiquidityReturnDelta: false,
                afterRemoveLiquidityReturnDelta: false
            });
    }

    // -----------------------------------------------
    // NOTE: see IHooks.sol for function documentation
    // -----------------------------------------------

    function beforeSwap(
        address,
        PoolKey calldata key,
        IPoolManager.SwapParams calldata params,
        bytes calldata
    ) external returns (bytes4, BeforeSwapDelta, uint24) {
        beforeSwapCount[key.toId()]++;
        beforeSwapValue[key.toId()] = params.amountSpecified;
        return (BaseHook.beforeSwap.selector, BeforeSwapDeltaLibrary.ZERO_DELTA, 0);
    }

    function afterSwap(
        address,
        PoolKey calldata key,
        IPoolManager.SwapParams calldata params,
        BalanceDelta,
        bytes calldata
    ) external returns (bytes4, int128) {
        afterSwapCount[key.toId()]++;
        afterSwapValue[key.toId()] = params.amountSpecified;
        return (BaseHook.afterSwap.selector, 0);
    }

    function beforeAddLiquidity(
        address,
        PoolKey calldata key,
        IPoolManager.ModifyLiquidityParams calldata params,
        bytes calldata
    ) external returns (bytes4) {
        beforeAddLiquidityCount[key.toId()]++;
        beforeAddLiquidityValue[key.toId()] = params.liquidityDelta;
        return BaseHook.beforeAddLiquidity.selector;
    }

    function beforeRemoveLiquidity(
        address,
        PoolKey calldata key,
        IPoolManager.ModifyLiquidityParams calldata params,
        bytes calldata
    ) external returns (bytes4) {
        beforeRemoveLiquidityCount[key.toId()]++;
        beforeRemoveLiquidityValue[key.toId()] = params.liquidityDelta;
        return BaseHook.beforeRemoveLiquidity.selector;
    }
}
