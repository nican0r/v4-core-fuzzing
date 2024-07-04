// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseSetup} from "@chimera/BaseSetup.sol";

import {IHooks} from "src/interfaces/IHooks.sol";
import {Deployers} from "test/utils/Deployers.sol";
import {PoolEmptyUnlockTest} from "src/test/PoolEmptyUnlockTest.sol";
import "src/test/ProxyPoolManager.sol";

abstract contract Setup is Deployers, BaseSetup {
    using Hooks for IHooks;

    PoolEmptyUnlockTest emptyUnlockRouter;

    function setup() internal virtual override {
        initializeManagerRoutersAndPoolsWithLiq(IHooks(address(0)));
        emptyUnlockRouter = new PoolEmptyUnlockTest(manager);
    }
}
