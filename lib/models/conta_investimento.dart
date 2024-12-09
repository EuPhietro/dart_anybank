import 'package:anybank/models/account.dart';

class ContaInvestimento extends Account with CalculateTax {
  double _saldo = 0.0;
  ContaInvestimento({required super.titular});

  @override
  void depositar({required double value}) {
    _saldo += value - calculate(value);
  }

  @override
  void transfer({required Account destinatario, required double value}) {
    if (_saldo >= value + calculate(value)) {
      _saldo - value + calculate(value);
      destinatario.depositar(value: value);
    }
  }
}
