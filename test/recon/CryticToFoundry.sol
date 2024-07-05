// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {FoundryAsserts} from "@chimera/FoundryAsserts.sol";

import {PoolManagerTargets} from "./PoolManagerTargets.sol";
import {Currency} from "src/types/Currency.sol";
import {PoolKey} from "src/types/PoolKey.sol";
import {BalanceDelta} from "src/types/BalanceDelta.sol";
import "forge-std/console.sol";

contract CryticToFoundry is Test, PoolManagerTargets, FoundryAsserts {
    function setUp() public {
        setup();
    }

    function test_counter_hooks() public {
        // positions were created in setup()
        assertEq(hook.beforeAddLiquidityCount(poolId), 1);
        assertEq(hook.beforeRemoveLiquidityCount(poolId), 0);

        assertEq(hook.beforeSwapCount(poolId), 0);
        assertEq(hook.afterSwapCount(poolId), 0);

        // Perform a test swap //
        bool zeroForOne = true;
        int256 amountSpecified = -1e18; // negative number indicates exact input swap
        poolManager_swap(zeroForOne, amountSpecified);
        // ------------------- //

        // assertEq(int256(swapDelta.amount0()), amountSpecified);

        assertEq(hook.beforeSwapCount(poolId), 1);
        assertEq(hook.afterSwapCount(poolId), 1);
    }
}
