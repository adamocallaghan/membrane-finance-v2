// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.0;

import {Id, MarketParams, NftMarketParams} from "../interfaces/IMorpho.sol";

/// @title MarketParamsLib
/// @author Morpho Labs
/// @custom:contact security@morpho.org
/// @notice Library to convert a market to its id.
library MarketParamsLib {
    /// @notice The length of the data used to compute the id of a market.
    /// @dev The length is 5 * 32 because `MarketParams` has 5 variables of 32 bytes each.
    uint256 internal constant MARKET_PARAMS_BYTES_LENGTH = 5 * 32;

    /// @notice Returns the id of the market `marketParams`.
    function id(MarketParams memory marketParams) internal pure returns (Id marketParamsId) {
        assembly ("memory-safe") {
            marketParamsId := keccak256(marketParams, MARKET_PARAMS_BYTES_LENGTH)
        }
    }

    function nftId(NftMarketParams memory nftMarketParams) internal view returns (Id) {
        return Id.wrap(
            keccak256(
                abi.encode(
                    nftMarketParams.nftContract,
                    nftMarketParams.stablecoin,
                    nftMarketParams.oracle,
                    nftMarketParams.irm,
                    nftMarketParams.lltv,
                    block.chainid
                )
            )
        );
    }
}
