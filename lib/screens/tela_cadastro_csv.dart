import 'package:flutter/material.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:teste_pi/components/dropzonewidget.dart';
import 'package:url_launcher/url_launcher.dart';

class CadastroScreenCSV extends StatelessWidget {
  const CadastroScreenCSV({super.key});

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
            'Cadastro de Perfil',
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
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Column(
              children: [
                const Text(
                  'Cadastro de Perfil via CSV',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: FileUploadWithHttp(),
                ),
                const Text('O arquivo CSV deve conter os campos: Aluno, E-mail Mauá e RG', style: TextStyle(color: Color.fromRGBO(195, 193, 193, 1), fontSize: 18),),
                TextButton(
                          onPressed: () {
                             _launchInWebView(Uri.parse("http://bit.ly/exportar_CSV_OpenLMS"));
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text('Como exportar o CSV pelo OpenLMS',
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: 18,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                            ],
                          )),
              ],
            ),
          ),
        ));
  }
}

