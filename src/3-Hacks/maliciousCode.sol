// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Foo {
    Bar bar;

    constructor(Bar _bar) {
        bar = Bar(_bar);
    }

    function callBar() public {
        bar.log();
    }
}

contract Bar {
    event Log(string message);

    function log() public {
        emit Log("Bar was called");
    }
}

// This code is hidden in a separate file
contract Mal {
    event Log(string message);

    function log() public {
        emit Log("Mal was called");
    }
}