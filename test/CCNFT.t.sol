// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {BUSD} from "../src/BUSD.sol";
import {CCNFT} from "../src/CCNFT.sol";

// Definición del contrato de prueba CCNFTTest que hereda de Test. 
// Declaración de direcciones y dos instancias de contratos (BUSD y CCNFT).
contract CCNFTTest is Test {
    address deployer;
    address c1;
    address c2;
    address funds;
    address fees;
    BUSD busd;
    CCNFT ccnft;

// Ejecución antes de cada prueba. 
// Inicializar las direcciones y desplegar las instancias de BUSD y CCNFT.
    function setUp() public {
        deployer = makeAddr("deployer");
        c1 = makeAddr("c1");
        c2 = makeAddr("c2");
        funds = makeAddr("funds");
        fees = makeAddr("fees");

        busd = new BUSD();
        ccnft = new CCNFT();

        ccnft.setFundsCollector(funds);
        ccnft.setFeesCollector(fees);
        ccnft.setFundsToken(address(busd)); 

        ccnft.setMaxValueToRaise(1000000);
        ccnft.addValidValues(100);
        ccnft.addValidValues(500);
        ccnft.addValidValues(1000);
        ccnft.setMaxBatchCount(1000);
        ccnft.setBuyFee(100);
        ccnft.setTradeFee(10);
        ccnft.setProfitToPay(100);
        ccnft.setCanBuy(true);
        ccnft.setCanTrade(true);
        ccnft.setCanClaim(true);
    }

// Prueba de "setFundsCollector" del contrato CCNFT. 
// Llamar al método y despues verificar que el valor se haya establecido correctamente.
    function testSetFundsCollector() public {
        address newFunds = makeAddr("newFunds");
        ccnft.setFundsCollector(newFunds);
        assertEq(ccnft.fundsCollector(), newFunds);
    }
    
// Prueba de "setFeesCollector" del contrato CCNFT
// Verificar que el valor se haya establecido correctamente.
    function testSetFeesCollector() public {
        address newFees = makeAddr("newFees");
        ccnft.setFeesCollector(newFees);
        assertEq(ccnft.feesCollector(), newFees);
    }

// Prueba de "setProfitToPay" del contrato CCNFT
// Verificar que el valor se haya establecido correctamente.
    function testSetProfitToPay() public {
        uint32 newProfit = 200;
        ccnft.setProfitToPay(newProfit);
        assertEq(ccnft.profitToPay(), newProfit);
    }

// Prueba de "setCanBuy" primero estableciéndolo en true y verificando que se establezca correctamente.
// Despues establecerlo en false verificando nuevamente.
    function testSetCanBuy() public {
        ccnft.setCanBuy(true);
        assertEq(ccnft.canBuy(), true);

        ccnft.setCanBuy(false);
        assertEq(ccnft.canBuy(), false);
    }

// Prueba de método "setCanTrade". Similar a "testSetCanBuy".
    function testSetCanTrade() public {
        ccnft.setCanTrade(true);
        assertEq(ccnft.canTrade(), true);

        ccnft.setCanTrade(false);
        assertEq(ccnft.canTrade(), false);
    }

// Prueba de método "setCanClaim". Similar a "testSetCanBuy".
    function testSetCanClaim() public {
        ccnft.setCanClaim(true);
        assertEq(ccnft.canClaim(), true);

        ccnft.setCanClaim(false);
        assertEq(ccnft.canClaim(), false);
    }

// Prueba de "setMaxValueToRaise" con diferentes valores.
// Verifica que se establezcan correctamente.
    function testSetMaxValueToRaise() public {
        ccnft.setMaxValueToRaise(500000);
        assertEq(ccnft.maxValueToRaise(), 500000);
    }

// Prueba de "addValidValues" añadiendo diferentes valores.
// Verificar que se hayan añadido correctamente.
    function testAddValidValues() public {
        ccnft.addValidValues(200);
        ccnft.addValidValues(300);
        assertTrue(ccnft.valueIsValid(200));
        assertTrue(ccnft.valueIsValid(300));
        // los del setUp también deberían estar
        assertTrue(ccnft.valueIsValid(100));
        assertTrue(ccnft.valueIsValid(500));
        assertTrue(ccnft.valueIsValid(1000));
    }

// Prueba de "setMaxBatchCount".
// Verifica que el valor se haya establecido correctamente.
    function testSetMaxBatchCount() public {
    }

// Prueba de "setBuyFee".
// Verificar que el valor se haya establecido correctamente.
    function testSetBuyFee() public {
    }

// Prueba de "setTradeFee".
// Verificar que el valor se haya establecido correctamente.
    function testSetTradeFee() public {
    }

// Prueba de que no se pueda comerciar cuando canTrade es false.
// Verificar que se lance un error esperado.
    function testCannotTradeWhenCanTradeIsFalse() public {
    }

// Prueba que no se pueda comerciar con un token que no existe, incluso si canTrade es true. 
// Verificar que se lance un error esperado.
    function testCannotTradeWhenTokenDoesNotExist() public {
    }
}
