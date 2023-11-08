import 'package:flutter/material.dart';
import 'package:teste_pi/components/botao_sair.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            'Cadastro',
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
        body: SizedBox(
          width: 400,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              key: _formKey,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nome',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Senha',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        print("Enviando alguma coisa");
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
