import 'package:flutter/material.dart';
import 'package:teste_pi/screens/tela_horario.dart';
import 'package:teste_pi/screens/tela_inicial.dart';
import 'package:teste_pi/screens/tela_login.dart';
import 'package:teste_pi/screens/tela_monitor.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste PI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const InitialScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute:  '/',
      routes: {
        '/': (context) => const InitialScreen(),
        '/horario': (context) => const HourScreen(),
        '/login':(context) =>  LoginScreen(),
        '/monitor':(context) =>  MonitorScreen()
      },
    );
  }
}