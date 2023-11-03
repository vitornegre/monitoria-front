import 'dart:html';

import 'package:flutter/material.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class HourScreen extends StatefulWidget {
  const HourScreen({Key? key}) : super(key: key);

  @override
  State<HourScreen> createState() => _HourScreenState();
}

class _HourScreenState extends State<HourScreen> {
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
          'Horário dos Monitores',
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
      body: Center(
        child: Container(
          height: 350,
          width: 450,
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(26),
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
          ),
          child: TextButton(
            onPressed: () {
              _launchInWebView(Uri.parse("https://bit.ly/monitoria_imt"));
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Horário dos Monitores',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Clique para acessar os horários dos monitores',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchInWebView(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $url');
  }
}
