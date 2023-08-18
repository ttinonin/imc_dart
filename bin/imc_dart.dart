import 'dart:convert';
import 'dart:io';

import 'package:imc_dart/imc_dart.dart' as imc_dart;

import '../models/Pessoa.dart';

void main(List<String> arguments) {
  double peso, altura;
  print("Programa calculo de IMC");

  print("Digite nome: ");
  String? nome = stdin.readLineSync(encoding: utf8);

  print("Digite sua altura (m): ");
  String? altura_s = stdin.readLineSync(encoding: utf8);

  print("Digite seu peso (kg): ");
  String? peso_s = stdin.readLineSync(encoding: utf8);

  try {
    altura = double.parse(altura_s!);
  } on Exception catch (e, _) {
    print("Altura inválida, assumindo como 1 (m)");
    altura = 1.0;
  }

  try {
    peso = double.parse(peso_s!);
  } on Exception catch (e, _) {
    print("Peso inválido, assumindo como 1 (kg)");
    peso = 1.0;
  }

  Pessoa pessoa = Pessoa(nome: nome!, peso: peso, altura: altura);

  double imc = imc_dart.calculaIMC(pessoa.peso, pessoa.altura);

  if(imc < 16) {
    print("${pessoa.nome} possui magreza grave");
    print("IMC: ${imc.toStringAsFixed(2)}");
    exit(0);
  } else if (imc >= 16 && imc < 17) {
    print("${pessoa.nome} possui magreza moderada");
    print("IMC: ${imc.toStringAsFixed(2)}");
    exit(0);
  } else if (imc >= 17 && imc < 18.5) {
    print("${pessoa.nome} possui magreza leve");
    print("IMC: ${imc.toStringAsFixed(2)}");
    exit(0);
  } else if (imc >= 18.5 && imc < 25) {
    print("${pessoa.nome} está saudável");
    print("IMC: ${imc.toStringAsFixed(2)}");
    exit(0);
  } else if (imc >= 25 && imc < 30) {
    print("${pessoa.nome} está com sobrepeso");
    print("IMC: ${imc.toStringAsFixed(2)}");
    exit(0);
  } else if (imc >= 30 && imc < 35) {
    print("${pessoa.nome} possui obesidade grau I");
    print("IMC: ${imc.toStringAsFixed(2)}");
    exit(0);
  } else if (imc >= 35 && imc < 40) {
    print("${pessoa.nome} possui obesidade grau II (severa)");
    print("IMC: ${imc.toStringAsFixed(2)}");
    exit(0);
  } else if (imc >= 40) {
    print("${pessoa.nome} possui obesidade grau III (mórbida)");
    print("IMC: ${imc.toStringAsFixed(2)}");
    exit(0);
  }
}
