import '../models/account.dart';

class ContaPoupanca extends Account {
  double _saldo = 0;
  double rendimento = 0.05;

  ContaPoupanca({required String titular}) : super(titular: titular);

//Estabelece uma lógica de instanciação, ou seja, cria uma instância de conta poupança
  factory ContaPoupanca.criar({required String titular}) {
    return ContaPoupanca(titular: titular);
  }
  @override
  void depositar({required double value}) {
    super.depositar(value: value);
    _saldo += value;
    print("Depósito feito com sucesso, seu saldo é de : $_saldo " "\n");
  }

  void render() {
    _saldo = _saldo * rendimento;
  }
}
