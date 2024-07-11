// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {vm} from "@chimera/Hevm.sol";
import "forge-std/console.sol";

import {BeforeAfter} from "./BeforeAfter.sol";
import {Properties} from "./Properties.sol";

abstract contract PoolManagerTargets is BaseTargetFunctions, Properties, BeforeAfter {
    function poolManager_swap(bool zeroForOne, int256 amountSpecified) public {
        // __before(msg.sender);
        // swap(key, zeroForOne, amountSpecified, ZERO_BYTES); // calling swap function defined in Deployers which simplifies call to PoolManager::swap
        // __after(msg.sender);
        // t(_after.swapValue - _before.swapValue >= amountSpecified, "user loses value in swap hook");
    }
}
