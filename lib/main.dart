import 'package:flutter/material.dart';
import 'questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  bool get temPerguntaselecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  var _notaTotal = 0;
  var _perguntaSelecionada = 0;

  final List _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual os seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'nota': 10},
        {'texto': 'João', 'nota': 5},
        {'texto': 'Léo', 'nota': 3},
        {'texto': 'Pedro', 'nota': 1},
      ]
    }
  ];

  void _responder(int nota) {
    if (temPerguntaselecionada) {
      setState(() {
        _perguntaSelecionada++;
        _notaTotal += nota;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //for (var textoResp in respostas) {
    //widgets.add(Resposta(textoResp, _responder));
//}

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Perguntas',
            ),
          ),
          body: temPerguntaselecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : Resultado(_notaTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
