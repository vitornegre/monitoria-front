import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';

abstract class IUserLoginRepo {
  Future<UserLogin>CadastrarUser(UserLogin userLogin);
  Future<UserLogin>GetCurrentUser();
}
