// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract AluguelAula03 {
    Aluguel private aluguel;

    constructor(
        string memory _nomeLocador,
        string memory _nomeLocatario,
        uint16 _valorAluguel
    ) {
        aluguel.nomeLocador = _nomeLocador;
        aluguel.nomeLocatario = _nomeLocatario;
        for (uint8 x = 0; x < 36; x++) {
            aluguel.listaAluguel[x] = _valorAluguel;
        }
    }

    struct Aluguel {
        string nomeLocador;
        string nomeLocatario;
        uint16[36] listaAluguel;
        bool status;
    }

    modifier validarMesSolicitado(uint8 _mesAluguel) {
        require(
            _mesAluguel >= 1 && _mesAluguel <= 36,
            "Mes de aluguel nao existe."
        );
        _;
    }

    function recuperarValorAluguel(uint8 _mesAluguel)
        external
        view
        validarMesSolicitado(_mesAluguel)
        returns (uint16 retornaValorAluguel)
    {
        return aluguel.listaAluguel[_mesAluguel - 1];
    }

    function recuperarNomeLocadorNomeLocatario()
        external
        view
        returns (string memory _nomeLocador, string memory _nomeLocatario)
    {
        _nomeLocador = aluguel.nomeLocador;
        _nomeLocatario = aluguel.nomeLocatario;
        return (_nomeLocador, _nomeLocatario);
    }

    function alterarNome(string memory _nome, uint8 _tipoPessoa)
        external
        returns (bool)
    {
        require(bytes(_nome).length != 0, "Informe o novo nome.");
        require(
            _tipoPessoa == 1 || _tipoPessoa == 2,
            "Tipo de pessoa incorreto."
        );
        if (_tipoPessoa == 1) {
            aluguel.nomeLocador = _nome;
            return true;
        } else if (_tipoPessoa == 2) {
            aluguel.nomeLocatario = _nome;
            return true;
        }
        return false;
    }

    function reajustarAluguel(uint8 _mesInicialReajuste, uint16 _valorReajuste)
        external
        validarMesSolicitado(_mesInicialReajuste)
        returns (uint8 qtdeRegistrosAlterados)
    {
        require(_valorReajuste > 0, "Valor de reajuste maior que 0");
        for (
            uint8 x = _mesInicialReajuste - 1;
            x <= aluguel.listaAluguel.length;
            x++
        ) {
            aluguel.listaAluguel[x] += _valorReajuste;
            qtdeRegistrosAlterados++;
        }
        return qtdeRegistrosAlterados;
    }
}

// 0xDe51062711dcf5B2e236E76047f84Fd184b5895e
