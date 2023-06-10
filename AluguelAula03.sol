// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract AluguelAula03 {
    string private nomeLocador;
    string private nomeLocatario;
    uint16[36] private listaAluguel;

    constructor(
        string memory _nomeLocador,
        string memory _nomeLocatario,
        uint16 _valorAluguel
    ) {
        nomeLocador = _nomeLocador;
        nomeLocatario = _nomeLocatario;
        for (uint8 x = 0; x < 36; x++) {
            listaAluguel[x] = _valorAluguel;
        }
    }

    function recuperarValorAluguel(uint8 mesAluguel)
        external
        view
        returns (uint16 retornaValorAluguel)
    {
        retornaValorAluguel = listaAluguel[mesAluguel];
        return retornaValorAluguel;
    }

    function recuperarNomeLocadorNomeLocatario()
        external
        view
        returns (string memory _nomeLocador, string memory _nomeLocatario)
    {
        _nomeLocador = nomeLocador;
        _nomeLocatario = nomeLocatario;
        return (_nomeLocador, _nomeLocatario);
    }

    function alterarNome(string memory _nome, uint8 _tipoPessoa)
        external
        returns (bool efetuado)
    {
        if (_tipoPessoa == 1) {
            nomeLocador = _nome;
            efetuado = true;
        } else if (_tipoPessoa == 2) {
            nomeLocatario = _nome;
            efetuado = true;
        } else {
            efetuado = false;
        }
        return efetuado;
    }

    function reajustarAluguel(uint8 _mesInicialReajuste, uint16 _valorReajuste)
        external
        returns (uint8 qtdeRegistrosAlterados)
    {
        for (uint256 x = _mesInicialReajuste; x <= listaAluguel.length; x++) {
            listaAluguel[x] = listaAluguel[x] + _valorReajuste;
            qtdeRegistrosAlterados++;
        }
        return qtdeRegistrosAlterados;
    }
}

// 0xeb11dC4d1CDfC79FE56A52B0554630D0218d5911
