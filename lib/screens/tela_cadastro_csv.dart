import 'package:flutter/material.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:teste_pi/components/dropzonewidget.dart';

class CadastroScreenCSV extends StatelessWidget {
  const CadastroScreenCSV({super.key});

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
            'Cadastro de Perfil',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: const <Widget>[
            BotaoSair(
              text: 'Voltar',
              redirect: '/admin',
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: DropzoneWidget(),
        ));
  }
}

