abstract class Account {
  String titular;
  double _emprestimo = 200;
  double _saldo = 0;
  List<double> _extrato = [];

  Account({required this.titular});

  void transfer({required Account destinatario, required double value}) {
    if (_saldo + _emprestimo < value) {
      print(
          "Seu saldo é menor que o valor que você está tentando transferir \n \n");
    } else {
      _saldo -= value;
      destinatario._saldo += value;
      print("Transferência concluída \n");
      print("Novo saldo remetente: $_saldo");
      print("Novo saldo destinatário: ${destinatario._saldo}");

      _extrato.add(value);
      destinatario._extrato.add(value);
    }
  }

  void depositar({required double value}) {
    _saldo += value;
    _extrato.add(value);
    print("Depósito feito com sucesso, seu saldo é de : $_saldo " "\n");
  }

  void showSaldo() {
    print("O saldo de $titular é de : $_saldo");
  }

  double returnSaldo() {
    return _saldo;
  }

  void showExtrato() {
    print("Extrato de $titular");
    for (double value in _extrato) {
      print(value);
    }
  }
}

mixin CalculateTax {
  double tax = 0.03;


  double calculate(double value){
return value*tax;
  }
}
