import 'package:flutter/material.dart';

class IndAdmin extends StatelessWidget{
  const IndAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 1, 1, 100),
      child:
        Container(
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Color.fromRGBO(74, 182, 98, 1),
          ),
          width: 100,
          height: 30,
          child: Center(child: const Text('Administrador', style: TextStyle(color: Colors.white, fontSize: 12),textAlign:TextAlign.center,)),
        ),
      );
  }
}