import 'package:flutter/material.dart';

class IconEx extends StatelessWidget{
  const IconEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child:
        Container(
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Color.fromRGBO(160, 58, 58, 1),
          ),
          width: 120,
          height: 120,
          margin: const EdgeInsets.all(10),
          child: const Center(child: Icon(Icons.assignment, color: Colors.white, size: 40)),
        ),
      );
  }
}

class IconExDone extends StatelessWidget{
  const IconExDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 20, 1, 100),
      child:
        Container(
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Color.fromRGBO(58, 160, 60, 1),
          ),
          width: 120,
          height: 120,
          margin: const EdgeInsets.all(10),
          child: const Center(child: Icon(Icons.assignment, color: Colors.white, size: 40)),
        ),
      );
  }
}