import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/AnswerAdapters/AnswerBackRepo.dart';
import 'package:teste_pi/adpters/AnswerAdapters/IAnswerRepo.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:teste_pi/components/campo_exercicio.dart';

import '../components/icon_exercicio.dart';

class AnswerScreen extends StatefulWidget {
  AnswerScreen({required Key? key, required this.exerciseID}) : super(key: key);
  late String exerciseID;

  @override
  State<AnswerScreen> createState() => _AnswerScreenState(exerciseID);
}

class _AnswerScreenState extends State<AnswerScreen> {
  _AnswerScreenState(this.exerciseID);

  bool _isLoading = true;
  List<TableRow> ExerciseList = [];
  late String exerciseID;

  List<bool> checkBoxList = [];

  IAnswerRepo answerRepo = AnswerBackRepo();
  @override
  void initState() {
    super.initState();
    InitializeExerciseList();
  }

  Future<void> InitializeExerciseList() async {
    ExerciseList = await CreateTableFromRepo(exercise_id: exerciseID);
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
          'Respostas',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: const <Widget>[
          BotaoSair(
            text: 'Voltar',
            redirect: '/exercicios',
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Table(children: _isLoading ? [] : ExerciseList),
      ),
    );
  }

  Future<List<TableRow>> CreateTableFromRepo({String? exercise_id}) async {
    List<TableRow> listToReturn = [];
    var answersList = await answerRepo.GetAnswers(exercise_id: exercise_id!);

    listToReturn.add(TableRow(children: [
      Container(
          color: const Color.fromARGB(255, 40, 40, 40),
          margin: const EdgeInsets.fromLTRB(22, 20, 0, 0),
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
          color: const Color.fromARGB(255, 40, 40, 40),
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          height: 40,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Resposta',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )),
      Container(
          color: const Color.fromARGB(255, 40, 40, 40),
          margin: const EdgeInsets.fromLTRB(0, 20, 22, 0),
          height: 40,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Validar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ))
    ]));

    int checkBoxesIndex = 0;

    for (var answer in answersList) {
      if (checkBoxesIndex >= checkBoxList.length) {
        checkBoxList.add(answer.is_right == 1);
      } else {
        checkBoxList[checkBoxesIndex] = answer.is_right == 1;
      }
      listToReturn.add(CreateTableRowUser(answer.exercise_id, answer.email,
          answer.content, answer.is_right, checkBoxesIndex));
      checkBoxesIndex++;
    }

    return listToReturn;
  }

  TableRow CreateTableRowUser(String exercise_id, String email, String content,
      int is_right, int indexInList) {
    return TableRow(children: [
      Container(
        //color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
          child: Text(email,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text(content,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: Checkbox(
          value: checkBoxList[indexInList],
          onChanged: (value) {
            setState(() {
              checkBoxList[indexInList] = value!;
              answerRepo.UpdateAnswer(
                  exercise_id: exercise_id, isRight: value! ? 1 : 0);
            });
          },
        ),
      )
    ]);
  }
}
