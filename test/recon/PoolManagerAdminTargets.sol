// // SPDX-License-Identifier: GPL-2.0
// pragma solidity ^0.8.0;

// import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
// import {BeforeAfter} from "./BeforeAfter.sol";
// import {Properties} from "./Properties.sol";
// import {vm} from "@chimera/Hevm.sol";

// abstract contract PoolManagerAdminTargets is BaseTargetFunctions, Properties, BeforeAfter {
//     function poolManager_collectProtocolFees(address recipient, address currency, uint256 amount) public {
//         uint256 amountCollected;
//         try poolManager.collectProtocolFees(recipient, Currency(currency), amount) returns (
//             uint256 tempAmountCollected
//         ) {
//             amountCollected = tempAmountCollected;
//         } catch {
//             t(false, "poolManager_collectProtocolFees");
//         }
//     }

//     function poolManager_donate(PoolKey calldata key, uint256 amount0, uint256 amount1, bytes memory hookData) public {
//         BalanceDelta delta;
//         try poolManager.donate(PoolKey(key), amount0, amount1, hookData) returns (BalanceDelta tempDelta) {
//             delta = tempDelta;
//         } catch {
//             t(false, "poolManager_donate");
//         }
//     }

//     function poolManager_initialize(PoolKey calldata key, uint160 sqrtPriceX96, bytes memory hookData) public {
//         int24 tick;
//         try poolManager.initialize(PoolKey(key), sqrtPriceX96, hookData) returns (int24 tempTick) {
//             tick = tempTick;
//         } catch {
//             t(false, "poolManager_initialize");
//         }
//     }

//     function poolManager_setOperator(address operator, bool approved) public {
//         bool value0;
//         try poolManager.setOperator(operator, approved) returns (bool tempValue0) {
//             value0 = tempValue0;
//         } catch {
//             t(false, "poolManager_setOperator");
//         }
//     }

//     function poolManager_setProtocolFee(PoolKey calldata key, uint24 newProtocolFee) public {
//         try poolManager.setProtocolFee(PoolKey(key), newProtocolFee) {} catch {
//             t(false, "poolManager_setProtocolFee");
//         }
//     }

//     function poolManager_setProtocolFeeController(address controller) public {
//         try poolManager.setProtocolFeeController(IProtocolFeeController(controller)) {} catch {
//             t(false, "poolManager_setProtocolFeeController");
//         }
//     }

//     function poolManager_transferOwnership(address newOwner) public {
//         try poolManager.transferOwnership(newOwner) {} catch {
//             t(false, "poolManager_transferOwnership");
//         }
//     }

//     function poolManager_unlock(bytes memory data) public {
//         bytes result;
//         try poolManager.unlock(data) returns (bytes tempResult) {
//             result = tempResult;
//         } catch {
//             t(false, "poolManager_unlock");
//         }
//     }

    // function poolManager_updateDynamicLPFee(PoolKey calldata key, uint24 newDynamicLPFee) public {
    //     try poolManager.updateDynamicLPFee(PoolKey(key), newDynamicLPFee) {} catch {
    //         t(false, "poolManager_updateDynamicLPFee");
    //     }
    // }
// }
