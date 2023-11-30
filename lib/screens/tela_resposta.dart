import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/AnswerAdapters/AnswerBackRepo.dart';
import 'package:teste_pi/adpters/AnswerAdapters/IAnswerRepo.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:teste_pi/components/campo_exercicio.dart';

import '../components/icon_exercicio.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({Key? key}) : super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  bool _isLoading = true;
  bool _isAnswered = false;
  List<TableRow> ExerciseList = [];
  String exercise_id = "111-111-111";

  @override
  void initState() {
    super.initState();
    InitializeExerciseList();
  }

  Future<void> InitializeExerciseList() async {
    ExerciseList = await CreateTableFromRepo(exercise_id: exercise_id);
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
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ),
          title: const Text(
            'Exercícios',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: const [
            BotaoSair(
              text: 'Voltar',
              redirect: '/',
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Table(children: _isLoading ? [] : ExerciseList)));
  }

  Future<List<TableRow>> CreateTableFromRepo({String? exercise_id}) async {
    IAnswerRepo answerRepo = AnswerBackRepo();
    List<TableRow> listToReturn = [];
    var answers = await answerRepo.GetAnswers(exercise_id: exercise_id!);
    print(answers[0].content);
    for (var element in answers) {
      listToReturn.add(TableRow(children: [
        IconEx(),
        Text(element.content),
        Checkbox(
          value: false,
          onChanged: (bool? value) {
            setState(() {
              _isAnswered = value!;
            });
          },
        )
      ]));
    }

    return listToReturn;
  }
}
