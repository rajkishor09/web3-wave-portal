// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    // an event to notify UI that new wave is added succesfully
    event NewWave(address indexed from, uint256 timestamp, string message);

    ///Custom datatype for storing wave info
    struct Wave {
        address waver; // who waved
        string message; // waver's message
        uint256 timestamp; // datetime when he/she waved
    }

    Wave[] waves;

    constructor() {
        console.log("Hardhat: Yo yo, I am a contract and I am smart");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s has waved!!!", msg.sender);
        // add the new wave to the list
        waves.push(Wave(msg.sender, _message, block.timestamp));
        // notify UI for new wave added
        emit NewWave(msg.sender, block.timestamp, _message);
    }

    // returns all waves available
    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}
