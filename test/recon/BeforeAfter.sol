// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {Setup} from "./Setup.sol";
// import {PoolId} from "src/types/PoolId.sol";

abstract contract BeforeAfter is Setup {
    mapping(address user => Vars) users;

    struct Vars {
        int256 swapValue;
        int256 liquidityValue;
    }

    Vars internal _before;
    Vars internal _after;

    function __before(address user) internal {
        _before.swapValue = hook.beforeSwapValue(poolId);
        _before.liquidityValue = hook.beforeAddLiquidityValue(poolId);
    }

    function __after(address user) internal {
        _after.swapValue = hook.afterSwapValue(poolId);
        _after.liquidityValue = hook.beforeRemoveLiquidityValue(poolId);
    }
}
