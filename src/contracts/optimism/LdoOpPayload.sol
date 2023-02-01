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

import {AaveV3Optimism} from 'aave-address-book/AaveV3Optimism.sol';
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
 * @dev Setting new Emssion Admin for LDO token in Aave V3 Optimism Liquidity Pool
 * Governance Forum Post: https://governance.aave.com/t/arfc-ldo-emission-admin-for-ethereum-arbitrum-and-optimism-v3-liquidity-pools/11478
 * Snapshot: TODO
 */
contract ChangeLdoEmissionAdminPayload is IProposalGenericExecutor {
  address public constant LDO = 0xFdb794692724153d1488CcdBE0C56c252596735F;

  address public constant NEW_EMISSION_ADMIN = 0x5033823F27c5f977707B58F0351adcD732C955Dd;

  function execute() public {
    IEmissionManager(AaveV3Optimism.EMISSION_MANAGER).setEmissionAdmin(LDO, NEW_EMISSION_ADMIN);
  }
}
