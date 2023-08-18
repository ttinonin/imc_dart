import 'package:imc_dart/imc_dart.dart';
import 'package:test/test.dart';

void main() {
  test('Deve calcular o IMC do usuário', () {
    expect(calculaIMC(80, 1.82), 24.151672503320853);
  });
}
