import 'dart:async';

import 'package:anybank/models/conta_poupanca.dart';

import 'models/conta_corrente.dart';

void main() {
  List<ContaCorrente> contas = <ContaCorrente>[];
  ContaCorrente yasmim = ContaCorrente(titular: "Yasmim Nayara");
  ContaCorrente henry = ContaCorrente(titular: "Henry Aguiar ");

  henry.transfer(destinatario: yasmim, value: 1400);

  for (ContaCorrente conta in contas) {
    print("Titular: ${conta.titular}");
    print("Saldo: ${conta.returnSaldo()} " "");

    print("\n");
  }
}
