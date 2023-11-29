import 'dart:convert';

import 'package:teste_pi/adpters/LoginAdapters/IUserLoginRepo.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:http/http.dart' as http;

class UserLoginBackRepo implements IUserLoginRepo {
  UserLogin currentUser =
      UserLogin("Lucas", "lucas@gmail.com", "1234", Roles.ADMIN);

  @override
  Future<UserLogin> CadastrarUser(UserLogin userLogin) async {
    var client = http.Client();
    var response = await client.post(
        Uri.parse("http://localhost:8000/create_user"),
        headers: {},
        body: {
          "email": userLogin.Email,
          "name": userLogin.Name,
          "role": "STUDENT",
          "password": userLogin.Password
        });

    print(response.body);

    return userLogin;
  }

  @override
  Future<UserLogin> GetCurrentUser() async {
    return currentUser;
  }
}
