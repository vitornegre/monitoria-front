import 'dart:convert';

import 'package:flutter/material.dart';
import 'icon_exercicio.dart';
import 'package:http/http.dart' as http;

class ExercicioMonitor extends StatelessWidget {
  final String text;
  final String exerciseID;
  const ExercicioMonitor(
      {Key? key, required this.text, required this.exerciseID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _deleteExercise() async {
      var uri = Uri.parse("https://monitoria-api.onrender.com/delete_exercise?exercise_id=$exerciseID");
      var response = await http.delete(uri);

      if (response.statusCode != 200) {
        print("Erro ${response.body}");
        return;
      }

      print("Exercicio deletado com sucesso");
      print(response);
      (context as Element).reassemble();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(children: [
        Column(children: [
          Row(
            children: [
              IconEx(),
              Text(
                text,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Respostas',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Editar',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _deleteExercise,
                  child: const Text('Excluir',
                      style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 1200,
                    child: TextField(
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
                              onPressed: () {},
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
