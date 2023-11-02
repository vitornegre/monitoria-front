import 'package:flutter/material.dart';
import 'package:teste_pi/components/botao_sair.dart';

class TelaRanking extends StatefulWidget {
  const TelaRanking({super.key});

  @override
  State<TelaRanking> createState() => _TelaRankingState();
}

class _TelaRankingState extends State<TelaRanking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        toolbarHeight: 85,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(25, 1, 1, 1),
          child: Image.asset(
            'assets/images/logo-IMT.png',
            width: 100,
            height: 100,
          ),
        ),
        title: const Text(
          'Ranking',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: const <Widget>[
          BotaoSair(
            text: 'Voltar',
            redirect: '/',
          )
        ],
      ),
      body: Table(children: [
        TableRow(children: [
          Container(
              color: const Color.fromARGB(255, 74, 182, 98),
              child: const Text(
                'Colocação',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )),
          Container(
              color: const Color.fromARGB(255, 74, 182, 98),
              child: const Text(
                'Aluno',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )),
          Container(
              color: const Color.fromARGB(255, 74, 182, 98),
              child: const Text(
                'Pontos',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ))
        ]),
        TableRow(children: [
          Text(
            '1',
            textAlign: TextAlign.center,
          ),
          Text(
            "Lucas Duez",
            textAlign: TextAlign.center,
          ),
          Text("42", textAlign: TextAlign.center)
        ])
      ]),
    );
  }
}
