import 'package:flutter/material.dart';
import 'icon_exercicio.dart';

class Exercicio extends StatelessWidget {
  const Exercicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconEx(),
            Text(
              'Qual é o time popularmente conhecido como Verdão?',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 920,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Resposta',
                      suffixIcon: Container(
                        margin: const EdgeInsets.fromLTRB(0,0,10,0),
                        width: 100,
                        height: 10,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Enviar'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
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
                  ),
                ))
          ],
        )
      ]),
    );
  }
}
