// SPDX-License_Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "../script/DeployeOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTIN_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployToken();
        ourToken = deployer.run();

        vm.prank(address(deployer));
        ourToken.transfer(bob, STARTIN_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTIN_BALANCE, ourToken.balnaceOf(bob));
    }
}
