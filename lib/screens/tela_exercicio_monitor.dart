import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/ExercisesAdapters/Exercise.dart';
import 'package:teste_pi/adpters/ExercisesAdapters/ExerciseBackRepo.dart';
import 'package:teste_pi/adpters/ExercisesAdapters/IExerciseRepo.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginBackRepo.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:teste_pi/components/campo_exercicio.dart';
import 'package:teste_pi/components/campo_exercicio_monitor.dart';
import 'package:teste_pi/components/indicador_perfil.dart';

class ExerciseScreenMonitor extends StatefulWidget {
  const ExerciseScreenMonitor({Key? key}) : super(key: key);

  @override
  State<ExerciseScreenMonitor> createState() => _ExerciseScreenMonitorState();
}

class _ExerciseScreenMonitorState extends State<ExerciseScreenMonitor> {
  bool _isLoading = true;
  List<Exercicio> ExerciciosList = [];

  @override
  void initState() {
    super.initState();
    InitializeExerciosList();
  }

  Future<void> InitializeExerciosList() async {
    ExerciciosList = await CreateExerciciosList();
    setState(() {
      _isLoading = false;
    });
  }

  Future<List<Exercicio>> CreateExerciciosList() async {
    List<Exercicio> listToReturn = [];
    IExerciseRepo exerciseRepo = ExerciseBackRepo();

    List<Exercise> allExercises = await exerciseRepo.GetAllExercises();

    for (var exercise in allExercises) {
      listToReturn.add(
          Exercicio(text: exercise.Enunciado, exerciseID: exercise.ExerciseId));
    }

    return listToReturn;
  }

  Widget GetUserRoleIndicator() {
    Roles userRole = UserLoginBackRepo.currentUser.Role;

    switch (userRole) {
      case Roles.ADMIN:
        return IndAdmin();
      case Roles.MONITOR:
        return IndMonitor();
      case Roles.PROFESSOR:
        return IndProfessor();
      default:
        return IndMonitor();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        toolbarHeight: 85,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(25, 1, 1, 1),
          child: Image.asset(
            'assets/images/logo-IMT.png',
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ),
        title: const Text(
          'Exercícios',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: const [
          BotaoSair(
            text: 'Voltar',
            redirect: '/',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            GetUserRoleIndicator(),
            Column(
              children: _isLoading ? [] : ExerciciosList,
            )
          ],
        )),
      ),
    );
  }
}
