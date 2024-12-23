pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {Morpho} from "../src/Morpho.sol";

contract DeployMorpho is Script {
    function run() external returns (Morpho) {
        // ===================
        // === SCRIPT VARS ===
        // ===================

        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        string memory DEPLOYER_PUBLIC_ADDRESS = "DEPLOYER_PUBLIC_ADDRESS";

        // ===========================
        // === ABSTRACT DEPLOYMENT ===
        // ===========================

        console2.log("###########################################");
        console2.log("########## Deploying to Abstract ##########");
        console2.log("###########################################");

        vm.createSelectFork("abstract");

        // Let's go...

        vm.startBroadcast(deployerPrivateKey);

        // deploy Membrane core contract
        Morpho membraneApp = new Morpho(vm.envAddress(DEPLOYER_PUBLIC_ADDRESS));
        console2.log("Membrane Address: ", address(membraneApp));

        vm.stopBroadcast();

        return membraneApp;
    }
}
