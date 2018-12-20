pragma solidity >= 0.5.0 < 0.6.0;

import "./AbstractRegistryService.sol";


/**
 * @title Registry Service Mock
 */
contract RegistryServiceMock is AbstractRegistryService {

  function deployAccount(bytes32 _salt) public {
    address[] memory _devices = new address[](0);
    registry.deployAccount(_salt, _devices);
  }
}
