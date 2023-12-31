// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        (address addressActiveNetworkConfig) = helperConfig.activeNetworkConfig();

        vm.startBroadcast(); //send everything below this line to rpc
        FundMe fundMe = new FundMe(addressActiveNetworkConfig);
        vm.stopBroadcast();

        return fundMe;
    }
}
