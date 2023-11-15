import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/RankingAdapters/IRankingRepo.dart';
import 'package:teste_pi/adpters/RankingAdapters/RankingRepoMock.dart';
import 'package:teste_pi/adpters/RankingAdapters/RankingUser.dart';
import 'package:teste_pi/components/botao_sair.dart';

class TelaRanking extends StatefulWidget {
  const TelaRanking({super.key});

  @override
  State<TelaRanking> createState() => _TelaRankingState();
}

class _TelaRankingState extends State<TelaRanking> {
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
      body: Table(children: CreateTableFromRepo()),
    );
  }

  List<TableRow> CreateTableFromRepo() {
    IRankingRepo repo = RankingRepoMock();

    List<RankingUser> usersList = repo.GetRanking("1");
    List<TableRow> listToReturn = [];

    listToReturn.add(TableRow(children: [
      Container(
          color: const Color.fromARGB(255, 74, 182, 98),
          child: const Text(
            'Colocação',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          )),
      Container(
          color: const Color.fromARGB(255, 74, 182, 98),
          child: const Text(
            'Aluno',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          )),
      Container(
          color: const Color.fromARGB(255, 74, 182, 98),
          child: const Text(
            'Pontos',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ))
    ]));

    for (var user in usersList) {
      listToReturn
          .add(CreateTableRowUser(user.Position, user.Name, user.Pontuation));
    }

    return listToReturn;
  }

  TableRow CreateTableRowUser(int position, String name, int pontuation) {
    return TableRow(children: [
      Text(position.toString(), textAlign: TextAlign.center),
      Text(name, textAlign: TextAlign.center),
      Text(pontuation.toString(), textAlign: TextAlign.center)
    ]);
  }
}
