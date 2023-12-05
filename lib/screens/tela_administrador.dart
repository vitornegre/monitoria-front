import 'package:flutter/material.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:teste_pi/components/indicador_perfil.dart';

import '../components/botao_cinza.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>{
  @override
  Widget build(BuildContext context){
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
          'Perfil do Administrador',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions:  const <Widget>[
          BotaoSair(text: 'Voltar', redirect: '/', color: Color.fromRGBO(182, 74, 74, 1))
        ],
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            IndAdmin(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
              child: BotaoGrey(text: 'Cadastro de Perfis', redirect: '/cadastro_perfil'),
            ),
            BotaoGrey(text: 'Cadastro de Disciplinas', redirect: '/cadastro_disciplina'),
          ]
        )
      ),
    );
  }
}