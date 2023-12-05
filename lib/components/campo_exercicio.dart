import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/AnswerAdapters/Answer.dart';
import 'package:teste_pi/adpters/AnswerAdapters/AnswerBackRepo.dart';
import 'package:teste_pi/adpters/AnswerAdapters/IAnswerRepo.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginBackRepo.dart';
import 'icon_exercicio.dart';

class Exercicio extends StatefulWidget {
  final String text;
  final String exerciseID;
  const Exercicio({Key? key, required this.text, required this.exerciseID})
      : super(key: key);

  @override
  State<Exercicio> createState() => _ExercicioState(exerciseID);
}

class _ExercicioState extends State<Exercicio> {
  String exerciseID;
  _ExercicioState(this.exerciseID);

  late String answerText;
  IAnswerRepo answerRepo = AnswerBackRepo();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(children: [
        Column(children: [
          Row(
            children: [
              IconEx(),
              Text(
                widget.text,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 1200,
                    child: TextField(
                        onChanged: (value) => answerText = value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26)),
                          labelText: 'Digite sua resposta',
                          suffixIcon: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            width: 100,
                            height: 10,
                            child: ElevatedButton(
                              onPressed: () async {
                                await answerRepo.CreateAnswer(Answer(
                                    exerciseID,
                                    UserLoginBackRepo.currentUser!.Email,
                                    answerText,
                                    1));
                              },
                              child: const Text('Enviar'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        style: TextStyle(height: 5, fontSize: 20),
                        cursorHeight: 20),
                  ))
            ],
          )
        ]),
      ]),
    );
  }
}
