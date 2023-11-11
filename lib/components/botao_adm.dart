import 'package:flutter/material.dart';

class BotaoAdm extends StatelessWidget{
  const BotaoAdm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 100, 1, 20),
      child:
        Container(
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Color.fromRGBO(131, 131, 131, 1),
          ),
          width: 350,
          height: 50,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/admin');
            },
            child: Text('Acessar Perfil do Administrador', style: TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center),
          ),
        )
    );
  }
}