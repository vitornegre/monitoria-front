import 'package:teste_pi/adpters/LoginAdapters/IUserLoginRepo.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';

class UserLoginRepoMock implements IUserLoginRepo {
  UserLogin currentUser =
      UserLogin("Lucas", "lucas@gmail.com", "1234", Roles.ADMIN);

  @override
  Future<UserLogin>CadastrarUser(UserLogin userLogin) async {
    return userLogin;
  }

  @override
  Future<UserLogin>GetCurrentUser() async {
    return currentUser;
  }
}
