import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginBackRepo.dart';
import 'package:teste_pi/components/botao_adm.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:teste_pi/components/indicador_perfil.dart';
import '../components/botoes_menu.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  StatelessWidget GetUserRoleIndicator() {
    switch (UserLoginBackRepo.currentUser.Role) {
      case Roles.STUDENT:
        return IndAluno();
      case Roles.MONITOR:
        return IndMonitor();
      case Roles.PROFESSOR:
        return IndProfessor();
      case Roles.ADMIN:
        return IndAdmin();
      default:
        return IndAluno();
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
          'Site da Monitoria',
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
            text: 'Sair',
            redirect: '/login',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetUserRoleIndicator(),
            BotoesMenu(),
            BotaoAdm(),
          ],
        )),
      ),
    );
  }
}
