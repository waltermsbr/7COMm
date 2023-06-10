// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract CalculoBonus {
    string public vendedor;
    uint256 public fatorBonus;

    constructor(string memory nmVendedor, uint256 vrFatorBonus) {
        vendedor = nmVendedor;
        fatorBonus = vrFatorBonus;
    }

    function calcularBonus(uint256 valorVenda)
        public
        view
        returns (uint256 valorComissao)
    {
        valorComissao = valorVenda * fatorBonus;
        return valorComissao;
    }
}

// 0xbbac6bfDfD2696f52eB52C83CB36462838D93002
