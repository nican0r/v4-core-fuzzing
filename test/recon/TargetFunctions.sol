// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {PoolKey} from "src/types/PoolKey.sol";
import {IPoolManager} from "src/interfaces/IPoolManager.sol";

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "./BeforeAfter.sol";
import {Properties} from "./Properties.sol";
import {vm} from "@chimera/Hevm.sol";

abstract contract TargetFunctions is BaseTargetFunctions, Properties, BeforeAfter {
    // function poolManager_approve(address spender, uint256 id, uint256 amount) public {
    //     bool value0;
    //     try poolManager.approve(spender, id, amount) returns (bool tempValue0) {
    //         value0 = tempValue0;
    //     } catch {
    //         t(false, "poolManager_approve");
    //     }
    // }
    // function poolManager_burn(address from, uint256 id, uint256 amount) public {
    //     try poolManager.burn(from, id, amount) {} catch {
    //         t(false, "poolManager_burn");
    //     }
    // }
    // function poolManager_mint(address to, uint256 id, uint256 amount) public {
    //     try poolManager.mint(to, id, amount) {} catch {
    //         t(false, "poolManager_mint");
    //     }
    // }
    // function poolManager_modifyLiquidity(
    //     PoolKey calldata key,
    //     IPoolManager.ModifyLiquidityParams calldata params,
    //     bytes memory hookData
    // ) public {
    //     BalanceDelta callerDelta;
    //     BalanceDelta feesAccrued;
    //     try poolManager.modifyLiquidity(PoolKey(key), IPoolManager.ModifyLiquidityParams(params), hookData) returns (
    //         BalanceDelta tempCallerDelta,
    //         BalanceDelta tempFeesAccrued
    //     ) {
    //         callerDelta = tempCallerDelta;
    //         feesAccrued = tempFeesAccrued;
    //     } catch {
    //         t(false, "poolManager_modifyLiquidity");
    //     }
    // }
    // function poolManager_settle(address currency) public {
    //     uint256 paid;
    //     try poolManager.settle(Currency(currency)) returns (uint256 tempPaid) {
    //         paid = tempPaid;
    //     } catch {
    //         t(false, "poolManager_settle");
    //     }
    // }
    // function poolManager_swap(
    //     PoolKey calldata key,
    //     IPoolManager.SwapParams calldata params,
    //     bytes memory hookData
    // ) public {
    //     BalanceDelta swapDelta;
    //     try poolManager.swap(PoolKey(key), IPoolManager.SwapParams(params), hookData) returns (
    //         BalanceDelta tempSwapDelta
    //     ) {
    //         swapDelta = tempSwapDelta;
    //     } catch {
    //         t(false, "poolManager_swap");
    //     }
    // }
    // function poolManager_sync(address currency) public {
    //     uint256 balance;
    //     try poolManager.sync(Currency(currency)) returns (uint256 tempBalance) {
    //         balance = tempBalance;
    //     } catch {
    //         t(false, "poolManager_sync");
    //     }
    // }
    // function poolManager_take(address currency, address to, uint256 amount) public {
    //     try poolManager.take(Currency(currency), to, amount) {} catch {
    //         t(false, "poolManager_take");
    //     }
    // }
    // function poolManager_transfer(address receiver, uint256 id, uint256 amount) public {
    //     bool value0;
    //     try poolManager.transfer(receiver, id, amount) returns (bool tempValue0) {
    //         value0 = tempValue0;
    //     } catch {
    //         t(false, "poolManager_transfer");
    //     }
    // }
    // function poolManager_transferFrom(address sender, address receiver, uint256 id, uint256 amount) public {
    //     bool value0;
    //     try poolManager.transferFrom(sender, receiver, id, amount) returns (bool tempValue0) {
    //         value0 = tempValue0;
    //     } catch {
    //         t(false, "poolManager_transferFrom");
    //     }
    // }
}
