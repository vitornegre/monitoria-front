import 'package:flutter/material.dart';

class IndAdmin extends StatelessWidget{
  const IndAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 20, 1, 100),
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

class IndMonitor extends StatelessWidget{
  const IndMonitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 20, 1, 100),
      child:
        Container(
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Color.fromRGBO(182, 171, 74, 1),
          ),
          width: 100,
          height: 30,
          child: Center(child: const Text('Monitor', style: TextStyle(color: Colors.white, fontSize: 12),textAlign:TextAlign.center,)),
        ),
      );
  }
}

class IndAluno extends StatelessWidget{
  const IndAluno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 20, 1, 50),
      child:
        Container(
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Color.fromRGBO(26, 151, 221, 1),
          ),
          width: 100,
          height: 30,
          child: Center(child: const Text('Aluno', style: TextStyle(color: Colors.white, fontSize: 12),textAlign:TextAlign.center,)),
        ),
      );
  }
}

class IndProfessor extends StatelessWidget{
  const IndProfessor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 20, 1, 100),
      child:
        Container(
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Color.fromRGBO(170, 26, 221, 1),
          ),
          width: 100,
          height: 30,
          child: Center(child: const Text('Professor', style: TextStyle(color: Colors.white, fontSize: 12),textAlign:TextAlign.center,)),
        ),
      );
  }
}