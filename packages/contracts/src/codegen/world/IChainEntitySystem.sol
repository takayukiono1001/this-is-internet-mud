// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

/**
 * @title IChainEntitySystem
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface IChainEntitySystem {
  function createChainEntity(string memory chain_id, string memory chain_name, string memory chain_color) external;

  function addLandEntity(string memory chain_id) external;
}
