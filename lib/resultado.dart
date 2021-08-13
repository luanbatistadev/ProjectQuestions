import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;

  Resultado(this.nota);

  String get fraseResultado {
    if (nota < 8) {
      return 'Parabéns!';
    } else if (nota < 12) {
      return 'Você é bom';
    } else if (nota < 16) {
      return 'Impressionate!';
    } else {
      return 'Nivel Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      fraseResultado,
      style: TextStyle(fontSize: 28),
    ));
  }
}
