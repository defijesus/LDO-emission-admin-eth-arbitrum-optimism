// SPDX-License-Identifier: MIT

/*
   _      ΞΞΞΞ      _
  /_;-.__ / _\  _.-;_\
     `-._`'`_/'`.-'
         `\   /`
          |  /
         /-.(
         \_._\
          \ \`;
           > |/
          / //
          |//
          \(\
           ``
     defijesus.eth
*/

pragma solidity ^0.8.16;

import 'forge-std/Test.sol';

import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {IProposalGenericExecutor} from 'aave-helpers/interfaces/IProposalGenericExecutor.sol';

interface IEmissionManager {
   /**
   * @dev Updates the admin of the reward emission
   * @dev Only callable by the owner of the EmissionManager
   * @param reward The address of the reward token
   * @param admin The address of the new admin of the emission
   */
  function setEmissionAdmin(address reward, address admin) external;
}

/**
 * @title ChangeLdoEmissionAdminPayload
 * @author Llama
 * @dev Setting new Emssion Admin for LDO token in Aave V3 Ethereum Liquidity Pool
 * Governance Forum Post: https://governance.aave.com/t/arfc-ldo-emission-admin-for-ethereum-arbitrum-and-optimism-v3-liquidity-pools/11478
 * Snapshot: TODO
 */
contract ChangeLdoEmissionAdminPayload is IProposalGenericExecutor {
  address public constant LDO = 0x5A98FcBEA516Cf06857215779Fd812CA3beF1B32;

  address public constant NEW_EMISSION_ADMIN = 0x87D93d9B2C672bf9c9642d853a8682546a5012B5;

  function execute() public {
    IEmissionManager(AaveV3Ethereum.EMISSION_MANAGER).setEmissionAdmin(LDO, NEW_EMISSION_ADMIN);
  }
}
