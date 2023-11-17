import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/LoginAdapters/IUserLoginRepo.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginRepoMock.dart';
import 'package:teste_pi/components/botao_sair.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String name;
  late String email;
  late String password;
  late Roles role;

  IUserLoginRepo userLoginRepo = UserLoginRepoMock();

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
        body: Center(
          child: SizedBox(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  key: _formKey,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          hintText: 'Nome',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          hintText: 'Email',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          hintText: 'Senha',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                        items: [
                          Roles.ADMIN,
                          Roles.MONITOR,
                          Roles.PROFESSOR,
                          Roles.STUDENT
                        ].map<DropdownMenuItem<Roles>>((value) {
                          return DropdownMenuItem<Roles>(
                            value: value,
                            child: Text(value.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          role = value ?? Roles.STUDENT;
                        },
                        hint: const Text("Cargo"),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cadastrocsv');
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text('Cadastro via CSV',
                                  style: TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline),
                                  textAlign: TextAlign.center),
                            ),
                          ],
                        )),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            UserLogin user =
                                UserLogin(name, email, password, role);

                            userLoginRepo.CadastrarUser(user);

                          },
                          child: const Text('Cadastrar'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
