import '../models/account.dart';

class ContaCorrente extends Account {
  double _emprestimo = 300.0;

  double _saldo = 1000;
  ContaCorrente({required String titular}) : super(titular: titular);

  //Construtor

  factory ContaCorrente.criar({required String titular}) {
    return ContaCorrente(titular: titular);
  }

//Método para depositar
  @override
  void depositar({required double value}) {
    super.depositar(value: value);
    _saldo += value;
    print("Depósito feito com sucesso, seu saldo é de : $_saldo " "\n");
  }

//Método de transferência
  @override
  void transfer({required Account destinatario, required double value}) {
    if (_emprestimo + _saldo >= value) {
      _saldo -= value;
      print("O saldo de $titular é de: $_saldo" "\n");
      print(
          "O saldo de ${destinatario.titular} é de ${destinatario.returnSaldo()}"
          "\n");
    }
    print("O saldo de $titular é insuficiente");
  }

//Método para mostrar o saldo do titular
  @override
  void showSaldo() {
    print(" O saldo de $titular é de: $_saldo");
  }

//Método para retornar o saldo do titular sem expor o atributo
  @override
  double returnSaldo() {
    return _saldo;
  }
}
