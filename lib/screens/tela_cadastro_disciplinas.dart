import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/DisciplineAdapters/Discipline.dart';
import 'package:teste_pi/adpters/DisciplineAdapters/DisciplineBackRepo.dart';
import 'package:teste_pi/adpters/DisciplineAdapters/IDisciplineRepo.dart';
import 'package:teste_pi/adpters/LoginAdapters/IUserLoginRepo.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginRepoMock.dart';
import 'package:teste_pi/components/botao_sair.dart';

class TelaCadastroDisciplinas extends StatefulWidget {
  const TelaCadastroDisciplinas({super.key});

  @override
  State<TelaCadastroDisciplinas> createState() =>
      _TelaCadastroDisciplinasState();
}

class _TelaCadastroDisciplinasState extends State<TelaCadastroDisciplinas> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String name;
  late String disciplineID;
  late int year;
  List<String> studentsEmailsList = [];

  IDisciplineRepo disciplineRepo = DisciplineBackRepo();

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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                            filled: true,
                            fillColor: Color.fromRGBO(234, 228, 228, 1),
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
                            filled: true,
                            fillColor: Color.fromRGBO(234, 228, 228, 1),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            hintText: 'Ano',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            year = int.parse(value);
                          },
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/cadastro_disciplina_csv');
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Text('Cadastro via CSV',
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                            ],
                          )),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),
                              color: Color.fromRGBO(26, 151, 221, 1),
                            ),
                            width: 138,
                            height: 38,
                            child: TextButton(
                                onPressed: () {
                                  disciplineRepo.CadastrarDiscipline(Discipline(
                                      this.name,
                                      "adsdas",
                                      this.year,
                                      this.studentsEmailsList));
                                },
                                child: Center(
                                    child: Text(
                                  "Cadastrar",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
