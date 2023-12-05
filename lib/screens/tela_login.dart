import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginBackRepo.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginRepoMock.dart';
import 'package:teste_pi/screens/tela_inicial.dart';

const users = const {
  'vitornegresiolo@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 500);
  UserLogin? userLogin;

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      var client = http.Client();
      var response = await client.get(
          Uri.parse(
              "https://monitoria-api.onrender.com/get_user?email=${data.name}"),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode != 200) {
        print("Erro ${response.body}");
        return response.body;
      }
      var user = UserLogin.fromJson(response.body);
      userLogin = user;
      UserLoginBackRepo.currentUser = userLogin!;
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      RegExp email =
          RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
      RegExp password = RegExp(r"^(?=.{8,255}$)");
      if (!email.hasMatch(data.name!)) {
        return "Email inválido";
      }
      if (!password.hasMatch(data.password!)) {
        return "Senha inválida";
      }
      var client = http.Client();
      var url = Uri.parse("https://monitoria-api.onrender.com/create_user");
      var response = client.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": data.name,
            "email": data.name,
            "password": data.password,
            "role": "STUDENT"
          }));
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return 'ok';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      //title: 'Site da Monitoria',
      logo: AssetImage('assets/images/logo-IMT.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => InitialScreen(userLogin: userLogin),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
