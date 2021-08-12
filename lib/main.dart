import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual os seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Léo', 'Pedro']
    }
  ];

  void _responder() {
    if (temPerguntaselecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaselecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List respostas = temPerguntaselecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : _perguntas;

    //for (var textoResp in respostas) {
    //widgets.add(Resposta(textoResp, _responder));
//}

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaselecionada
              ? Column(
                  children: <Widget>[
                    Questao(_perguntas[_perguntaSelecionada]['texto']),
                    ...respostas.map((t) => Resposta(t, _responder)).toList(),
                  ],
                )
              : Resultado()),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
