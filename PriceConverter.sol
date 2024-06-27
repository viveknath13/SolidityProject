// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns (uint256) {
        AggregatorV3Interface PriceFedd = AggregatorV3Interface(
            0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43 //sepoila testnet addresss
        );
        (, int256 price, , , ) = PriceFedd.latestRoundData();
        return uint256(price * 1e10);
    }

    function getconversionRate(uint256 EthAmount)
        internal
        view
        returns (uint256)
    {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * EthAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() internal view returns (uint256) {
        return
            AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43)
                .version();
    }
}
