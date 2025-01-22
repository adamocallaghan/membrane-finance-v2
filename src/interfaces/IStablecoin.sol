// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.0;

interface IStablecoin {
    /// @notice Mints new stablecoin tokens
    /// @param to The address to mint tokens to
    /// @param amount The amount of tokens to mint
    function mint(address to, uint256 amount) external;

    /// @notice Burns stablecoin tokens
    /// @param from The address to burn tokens from
    /// @param amount The amount of tokens to burn
    function burn(address from, uint256 amount) external;

    /// @notice Returns the total supply of stablecoins
    function totalSupply() external view returns (uint256);

    /// @notice Returns the balance of an account
    /// @param account The address to query
    function balanceOf(address account) external view returns (uint256);

    /// @notice Approves spending of tokens
    /// @param spender The address allowed to spend
    /// @param amount The amount of tokens to allow
    function approve(address spender, uint256 amount) external returns (bool);

    /// @notice Transfers tokens from one address to another
    /// @param from The address to transfer from
    /// @param to The address to transfer to
    /// @param amount The amount to transfer
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    /// @notice Returns the number of decimals of the token
    function decimals() external view returns (uint8);
} 