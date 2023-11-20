// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract D {
    string[] public inheritancePath;

    constructor() {
        // Add identifier of this contract to the inheritance path
        inheritancePath.push("D");
    }
}

contract C is D {
    constructor() {
        // Add identifier of this contract to the inheritance path
        inheritancePath.push("C");
    }
}

contract B is D {
    constructor() {
        // Add identifier of this contract to the inheritance path
        inheritancePath.push("B");
    }
}

contract A is C, B {
    constructor() {
        // Add identifier of this contract to the inheritance path
        inheritancePath.push("A");
    }

    // get the MRO of this contract:
    function getMRO() public view returns (string memory) {
        string memory path = "";
        for (uint i = inheritancePath.length; i > 0; i--) {
            path = string(abi.encodePacked(path, inheritancePath[i - 1]));
        }
        return path;
    }
}

