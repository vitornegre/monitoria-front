import 'package:teste_pi/adpters/LoginAdapters/IUserLoginRepo.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';

class UserLoginRepoMock implements IUserLoginRepo {
  UserLogin currentUser =
      UserLogin("Lucas", "lucas@gmail.com", "1234", Roles.ADMIN);

  @override
  UserLogin CadastrarUser(UserLogin userLogin) {
    return userLogin;
  }

  @override
  UserLogin GetCurrentUser() {
    return currentUser;
  }
}
