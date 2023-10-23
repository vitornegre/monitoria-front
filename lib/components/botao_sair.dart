import 'package:flutter/material.dart';

class BotaoSair extends StatelessWidget{
  final String text;
  final String redirect;

  const BotaoSair({Key? key, required this.text, required this.redirect}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 25, 25, 25),
      child: Container(
        decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: const Color.fromRGBO(182, 74, 74, 1),
        ),
        width: 100,
        height: 30,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(redirect);  
          },
          child: Center(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14,),textAlign: TextAlign.center,)),
      ),
        ),
    );
  }
}