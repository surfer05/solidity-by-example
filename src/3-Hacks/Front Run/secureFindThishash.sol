// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract SecureFindThisHash {
    // Struct is used to store the commit details
    struct Commit {
        bytes32 solutionHash;
        uint commitTime;
        bool revealed;
    }

    // The hash that is needed to be solved
    bytes32 public hash = 0x564ccaf7594d66b1eaaea24fe01f0585bf52ee70852af4eac0cc4b04711cd0e2;

    // Address of the winner
    address public winner;

    // Prive to be rewarded
    uint public reward;

    // Status of game
    bool public ended;

    // Mapping t ostore the commit details with address
    mapping(address => Commit) commits;

    // Modifier to check if the game is active
    modifier gameActive() {
        require(!ended, "Game has ended");
        _;
    }

    constructor() payable {
        reward = msg.value;
    }

    function commitSolution(bytes32 _solutionHash) public gameActive {
        Commit storage commit = commits[msg.sender];
        require(commit.commitTime == 0, "Already committed");
        commit.solutionHash = _solutionHash;
        commit.commitTime = block.timestamp;
        commit.revealed = false;
    }

    function getMySolution() public view returns (bytes32, uint, bool){
        Commit storage commit = commits[msg.sender];
        require(commit.commitTime != 0,"Not committed yet");
        return(commit.solutionHash, commit.commitTime, commit.revealed);
    }

    function revealMySolution( string memory _solution) public gameActive {
        
    }
}