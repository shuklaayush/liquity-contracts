// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.11;

import {Test} from "forge-std/Test.sol";

import {SortedTroves} from "../contracts/SortedTroves.sol";
import {TroveManager} from "../contracts/TroveManager.sol";
import {ActivePool} from "../contracts/ActivePool.sol";
import {StabilityPool} from "../contracts/StabilityPool.sol";
import {GasPool} from "../contracts/GasPool.sol";
import {DefaultPool} from "../contracts/DefaultPool.sol";
import {CollSurplusPool} from "../contracts/CollSurplusPool.sol";
import {BorrowerOperations} from "../contracts/BorrowerOperations.sol";
import {HintHelpers} from "../contracts/HintHelpers.sol";
import {LUSDToken} from "../contracts/LUSDToken.sol";

import {PriceFeedTestnet} from "../contracts/TestContracts/PriceFeedTestnet.sol";
import {FunctionCaller} from "../contracts/TestContracts/FunctionCaller.sol";

contract LiquityPlaygroundTest is Test {
    SortedTroves sortedTroves;
    TroveManager troveManager;
    ActivePool activePool;
    StabilityPool stabilityPool;
    GasPool gasPool;
    DefaultPool defaultPool;
    CollSurplusPool collSurplusPool;
    BorrowerOperations borrowerOperations;
    HintHelpers hintHelpers;
    LUSDToken lusdToken;

    PriceFeedTestnet priceFeedTestnet;
    FunctionCaller functionCaller;

    function setUp() public {
        sortedTroves = new SortedTroves();
        troveManager = new TroveManager();
        activePool = new ActivePool();
        stabilityPool = new StabilityPool();
        gasPool = new GasPool();
        defaultPool = new DefaultPool();
        collSurplusPool = new CollSurplusPool();
        borrowerOperations = new BorrowerOperations();
        hintHelpers = new HintHelpers();
        lusdToken = new LUSDToken(
            address(troveManager),
            address(stabilityPool),
            address(borrowerOperations)
        );

        priceFeedTestnet = new PriceFeedTestnet();
        functionCaller = new FunctionCaller();
    }

    function testTrue() public {
        assertTrue(true);
    }
}
