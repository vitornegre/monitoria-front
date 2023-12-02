import 'package:flutter/material.dart';
import 'package:teste_pi/screens/tela_administrador.dart';
import 'package:teste_pi/screens/tela_cadastro.dart';
import 'package:teste_pi/screens/tela_cadastro_alunos.dart';
import 'package:teste_pi/screens/tela_cadastro_csv.dart';
import 'package:teste_pi/screens/tela_exercicio_aluno.dart';
import 'package:teste_pi/screens/tela_exercicio_monitor.dart';
import 'package:teste_pi/screens/tela_resposta.dart';
import 'package:teste_pi/screens/tela_cadastro_disciplinas.dart';
import 'package:teste_pi/screens/tela_horario.dart';
import 'package:teste_pi/screens/tela_inicial.dart';
import 'package:teste_pi/screens/tela_login.dart';
import 'package:teste_pi/screens/tela_monitor.dart';
import 'package:teste_pi/screens/tela_ranking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site da Monitoria',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'KoHo'),
      //home: const InitialScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ExerciseScreenMonitor(),
        '/login': (context) => LoginScreen(),
        '/monitor': (context) => const MonitorScreen(),
        '/ranking': (context) => const RankingScreen(),
        '/admin': (context) => const AdminScreen(),
        '/cadastro_perfil': (context) => const TelaCadastro(),
        '/cadastro_aluno': (context) => const TelaCadastroAlunos(),
        '/cadastro_csv': (context) => const CadastroScreenCSV(),
        '/respostas': (context) => const AnswerScreen(),
        '/exercicios': (context) => const ExerciseScreen(),
        '/cadastro_disciplina': (context) => const TelaCadastroDisciplinas()
      },
    );
  }
}
