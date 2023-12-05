import 'dart:html';

import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginBackRepo.dart';
import 'package:teste_pi/adpters/RankingAdapters/IRankingRepo.dart';
import 'package:teste_pi/adpters/RankingAdapters/RankingBackRepo.dart';
import 'package:teste_pi/adpters/RankingAdapters/RankingRepoMock.dart';
import 'package:teste_pi/adpters/RankingAdapters/RankingUser.dart';
import 'package:teste_pi/components/botao_sair.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  bool _isLoading = true;
  List<TableRow> RankingList = [];

  @override
  void initState() {
    super.initState();
    InitializeRankingList();
  }

  Future<void> InitializeRankingList() async {
    RankingList = await CreateTableFromRepo();
    setState(() {
      _isLoading = false;
    });
  }

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
          'Ranking',
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
      body: SingleChildScrollView(
        child: Table(children: _isLoading ? [] : RankingList),
      ),
    );
  }

  Future<List<TableRow>> CreateTableFromRepo() async {
    IRankingRepo repo = RankingBackRepo();
    List<RankingUser> usersList = [];
    usersList = await repo.GetRanking();
    List<TableRow> listToReturn = [];

    listToReturn.add(TableRow(children: [
      Container(
          color: const Color.fromARGB(255, 74, 182, 98),
          margin: const EdgeInsets.fromLTRB(22, 20, 0, 0),
          height: 40,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Colocação',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )),
      Container(
          color: const Color.fromARGB(255, 74, 182, 98),
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          height: 40,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Aluno',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )),
      Container(
          color: const Color.fromARGB(255, 74, 182, 98),
          margin: const EdgeInsets.fromLTRB(0, 20, 22, 0),
          height: 40,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Pontos',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ))
    ]));

    for (var user in usersList) {
      listToReturn.add(CreateTableRowUser(
        user.Position,
        user.Email,
        user.Name,
        user.Pontuation,
      ));
    }

    return listToReturn;
  }

  TableRow CreateTableRowUser(
      int position, String email, String name, int pontuation) {
    return TableRow(
        decoration: email == UserLoginBackRepo.currentUser?.Email
            ? BoxDecoration(color: const Color.fromARGB(179, 255, 193, 7))
            : null,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(position.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                  child: Text(name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ),
              Container(
                  child: Text(email,
                      style: TextStyle(
                          fontSize: 15, color: Color.fromRGBO(43, 71, 167, 1)),
                      textAlign: TextAlign.center)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(pontuation.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          )
        ]);
  }
}
