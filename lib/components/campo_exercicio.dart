import 'package:flutter/material.dart';
import 'icon_exercicio.dart';

class Exercicio extends StatelessWidget{
  const Exercicio({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconEx(),
        Text('Qual é o time popularmente conhecido como Verdão?', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
        Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Resposta',
              ),
            ),
          ],
        )
      ]
    );
  }
}