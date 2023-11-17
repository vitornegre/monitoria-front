import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';

abstract class IUserLoginRepo {
  UserLogin CadastrarUser(UserLogin userLogin);
  UserLogin GetCurrentUser();
}
