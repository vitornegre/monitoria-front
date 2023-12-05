import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginBackRepo.dart';
import 'package:teste_pi/components/botao_adm.dart';
import 'package:teste_pi/components/botao_sair.dart';
import 'package:teste_pi/components/indicador_perfil.dart';
import '../components/botoes_menu.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key, this.userLogin}) : super(key: key);
  final UserLogin? userLogin;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  String _loginText() {
    if (UserLoginBackRepo.currentUser == null) {
      return "Login";
    }
    return "Sair";
  }

  Color _loginColor() {
    if (UserLoginBackRepo.currentUser == null) {
      return Color.fromRGBO(0, 71, 133, 1);
    }
    return Color.fromRGBO(182, 74, 74, 1);
  }

  StatelessWidget GetUserRoleIndicator() {
    switch (UserLoginBackRepo.currentUser?.Role) {
      case Roles.ADMIN:
        return IndAdmin();
      case Roles.MONITOR:
        return IndMonitor();
      case Roles.TEACHER:
        return IndTeacher();
      case Roles.STUDENT:
        return IndAluno();
      case null:
        return IndSemPerfil();
      default:
        return IndSemPerfil();
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
        actions: [
          BotaoSair(
            text: _loginText(),
            redirect: '/login',
            color: _loginColor(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetUserRoleIndicator(),
            BotoesMenu(userLogin: UserLoginBackRepo.currentUser),
            BotaoAdm(userLogin: UserLoginBackRepo.currentUser),
          ],
        )),
      ),
    );
  }
}
