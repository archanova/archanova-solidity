pragma solidity >= 0.5.0 < 0.6.0;

import "@netgum/solidity/contracts/ens/ENSMock.sol";
import "@netgum/solidity/contracts/ens/ENSRegistrarMock.sol";
import "@netgum/solidity/contracts/ens/ENSResolverMock.sol";


/**
 * @title Migrations
 */
contract Migrations {
  address public owner;

  uint public last_completed_migration;

  constructor() public {
    owner = msg.sender;
  }

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}
