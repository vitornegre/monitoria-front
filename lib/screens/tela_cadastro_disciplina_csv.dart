import 'package:flutter/material.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/disciplina_dropzonewidget.dart';

class CadastroDisciplinaScreenCSV extends StatelessWidget {
  const CadastroDisciplinaScreenCSV({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _launchInWebView(Uri url) async {
      if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
        throw Exception('Could not launch $url');
      }
    }
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
            'Cadastro de Disciplina',
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Column(
              children: [
                const Text(
                  'Cadastro de Disciplina via CSV',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: FileUploadDisciplineWithHttp(),
                ),
                const Text('O arquivo CSV deve conter os campos: Nome e Ano', style: TextStyle(color: Color.fromRGBO(195, 193, 193, 1), fontSize: 18),),
              ],
            ),
          ),
        ));
  }
}

