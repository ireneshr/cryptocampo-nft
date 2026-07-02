// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {CCNFT} from "../src/CCNFT.sol";

contract DeployCCNFT is Script {
    function run() external returns (CCNFT) {
        address busdAddress = vm.envAddress("BUSD_ADDRESS");

        vm.startBroadcast();

        CCNFT ccnft = new CCNFT();

        // Configuracion de direcciones
        ccnft.setFundsToken(busdAddress);
        ccnft.setFundsCollector(msg.sender);
        ccnft.setFeesCollector(msg.sender);

        // Configuracion de valores validos (en BUSD con 18 decimales)
        ccnft.addValidValues(100 * 10 ** 18); // NFT de 100 BUSD
        ccnft.addValidValues(500 * 10 ** 18); // NFT de 500 BUSD
        ccnft.addValidValues(1000 * 10 ** 18); // NFT de 1000 BUSD

        // Configuracion de limites
        ccnft.setMaxValueToRaise(1_000_000 * 10 ** 18); // 1 millon de BUSD
        ccnft.setMaxBatchCount(10);

        // Configuracion de comisiones (base 10000)
        ccnft.setBuyFee(250); // 2.5%
        ccnft.setTradeFee(250); // 2.5%
        ccnft.setProfitToPay(1000); // 10%

        // Habilitar operaciones
        ccnft.setCanBuy(true);
        ccnft.setCanTrade(true);
        ccnft.setCanClaim(true);

        vm.stopBroadcast();

        return ccnft;
    }
}
