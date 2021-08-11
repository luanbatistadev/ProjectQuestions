import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20));

    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: style, child: Text(texto), onPressed: quandoSelecionado),
    );
  }
}
