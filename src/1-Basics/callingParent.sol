// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

/* Inheritance tree
    A
   / \
  B  C
  \  /
   D
*/

contract A {
    // This is called an event. You can emit events from your function and they are logged into the transaction log. In our case, this will be useful for tracing function calls.

    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("B.foo called");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}


contract C is A {
    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}

/* Inheritance tree
    A
   / \
  B  C
  \  /
   D
*/

contract D is B,C {

    function foo() public override(B,C) {
        super.foo();
    }

    function bar() public override(B,C){
        super.bar();
    }
}