import 'dart:convert';

import 'package:teste_pi/adpters/LoginAdapters/IUserLoginRepo.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:http/http.dart' as http;

class UserLoginBackRepo implements IUserLoginRepo {
  static UserLogin currentUser =

      UserLogin("Lucas", "lucas@gmail.com", "1234", Roles.MONITOR);


  @override
  Future<UserLogin> CadastrarUser(UserLogin userLogin) async {
    var client = http.Client();
    var url = Uri.parse("https://monitoria-api.onrender.com/create_user");
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userLogin.toJson()));

    return userLogin;
  }

  @override
  Future<UserLogin> GetCurrentUser() async {
    return UserLoginBackRepo.currentUser;
  }
}
