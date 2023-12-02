import 'package:flutter/material.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:teste_pi/components/campo_exercicio.dart';
import 'package:teste_pi/components/indicador_perfil.dart';

class ExerciseScreenMonitor extends StatefulWidget {
  const ExerciseScreenMonitor({Key? key}) : super(key: key);

  @override
  State<ExerciseScreenMonitor> createState() => _ExerciseScreenMonitorState();
}

class _ExerciseScreenMonitorState extends State<ExerciseScreenMonitor> {
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
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ),
        title: const Text(
          'Exercícios',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: const [
          BotaoSair(
            text: 'Voltar',
            redirect: '/',
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            IndMonitor(),
            Exercicio(
              text: 'Qual é o time popularmente conhecido por verdão?',
            ),
            Exercicio(
              text: 'Quem foi o primeiro presidente do Brasil?',
            ),
          ],
        )),
      ),
    );
  }
}
