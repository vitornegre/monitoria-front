import 'package:flutter/material.dart';
import 'icon_exercicio.dart';

class Exercicio extends StatelessWidget {
  final String text;
  const Exercicio({Key? key, required this.text}) : super(key: key);

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
                text,
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
