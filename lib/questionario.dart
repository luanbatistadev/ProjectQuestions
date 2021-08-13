import 'package:flutter/material.dart';
import './questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List perguntas;
  final void Function(int) responder;
  final int perguntaSelecionada;

  Questionario(
      {required this.perguntaSelecionada,
      required this.perguntas,
      required this.responder});

  bool get temPerguntaselecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List respostas = temPerguntaselecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : perguntas;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'],
             ()=> responder (resp['nota']));
        }  
        ).toList(),
        ],
    );
  }
}
