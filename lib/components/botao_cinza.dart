import 'package:flutter/material.dart';

class BotaoGrey extends StatelessWidget{
  final String text;
  final String redirect;

  const BotaoGrey({Key? key, required this.text, required this.redirect}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 25, 25, 25),
      child: Container(
        decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: const Color.fromRGBO(131, 131, 131, 1),
        ),
        width: 300,
        height: 50,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(redirect);  
          },
          child: Center(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 20,),textAlign: TextAlign.center,)),
      ),
        ),
    );
  }
}