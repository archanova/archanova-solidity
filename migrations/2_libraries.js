const ECDSA = artifacts.require('ECDSA');
const SafeMath = artifacts.require('SafeMath');

const AccountLibrary = artifacts.require('AccountLibrary');
const AccountLibraryExample = artifacts.require('AccountLibraryExample');
const GuardedExample = artifacts.require('GuardedExample');
const PlatformAccountProvider = artifacts.require('PlatformAccountProvider');
const PlatformAccountProxy = artifacts.require('PlatformAccountProxy');

module.exports = async (deployer) => {
  await deployer.deploy(ECDSA);
  await deployer.deploy(SafeMath);

  deployer.link(ECDSA, AccountLibrary);

  await deployer.deploy(AccountLibrary);

  deployer.link(AccountLibrary, AccountLibraryExample);
  deployer.link(AccountLibrary, GuardedExample);
  deployer.link(AccountLibrary, PlatformAccountProvider);

  deployer.link(ECDSA, PlatformAccountProvider);
  deployer.link(ECDSA, PlatformAccountProxy);

  deployer.link(SafeMath, PlatformAccountProxy);
};
