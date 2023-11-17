import 'package:flutter/material.dart';
import 'package:teste_pi/screens/tela_administrador.dart';
import 'package:teste_pi/screens/tela_cadastro.dart';
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
        '/': (context) => const InitialScreen(),
        '/login': (context) => LoginScreen(),
        '/monitor': (context) => const MonitorScreen(),
        '/ranking': (context) => const RankingScreen(),
        '/admin': (context) => const AdminScreen(),
        '/cadastro_perfil': (context) => const TelaCadastro(),
      },
    );
  }

}
