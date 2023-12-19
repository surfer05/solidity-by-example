// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "../../../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract SecureFindThisHash {
    // Struct is used to store the commit details
    struct Commit {
        bytes32 solutionHash;
        uint commitTime;
        bool revealed;
    }

    // The hash that is needed to be solved
    bytes32 public hash =
        0x564ccaf7594d66b1eaaea24fe01f0585bf52ee70852af4eac0cc4b04711cd0e2;

    // Address of the winner
    address public winner;

    // Prize to be rewarded
    uint public reward;

    // Status of game
    bool public ended;

    // Mapping to store the commit details with address
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

    function getMySolution() public view returns (bytes32, uint, bool) {
        Commit storage commit = commits[msg.sender];
        require(commit.commitTime != 0, "Not committed yet");
        return (commit.solutionHash, commit.commitTime, commit.revealed);
    }

    function revealMySolution(
        string memory _solution,
        string memory _secret
    ) public gameActive {
        Commit storage commit = commits[msg.sender];
        require(commit.commitTime != 0, "Not committed yet");
        require(
            commit.commitTime < block.timestamp,
            "Cannot reveal in the same block"
        );
        require(!commit.revealed, "Already commited and revealed");

        bytes32 solutionHash = keccak256(
            abi.encodePacked(
                Strings.toHexString(msg.sender),
                _solution,
                _secret
            )
        );
        require(solutionHash == commit.solutionHash, "Hash doesn't match");

        require(
            keccak256(abi.encodePacked(_solution)) == hash,
            "Incorrect answer"
        );

        winner = msg.sender;
        ended = true;

        (bool sent, ) = payable(msg.sender).call{value: reward}("");
        if (!sent) {
            winner = address(0);
            ended = false;
            revert("Failed to send ether.");
        }
    }
}
