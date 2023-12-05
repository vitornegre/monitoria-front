import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginBackRepo.dart';

class BotaoAdm extends StatelessWidget {
  const BotaoAdm({Key? key, this.userLogin}) : super(key: key);
  final UserLogin? userLogin;

  bool _isUserAllowed(List<Roles> rolesAllowed, UserLogin? user) {
    if (user == null) {
      return false;
    }
    return rolesAllowed.contains(user.Role);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(1, 100, 1, 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: _isUserAllowed([Roles.ADMIN], userLogin)
                ? Color.fromRGBO(131, 131, 131, 1)
                : Color.fromRGBO(217, 217, 217, 1),
          ),
          width: 350,
          height: 50,
          child: TextButton(
            onPressed:
                _isUserAllowed([Roles.ADMIN], userLogin)
                    ? () {
                        Navigator.of(context).pushReplacementNamed('/admin');
                      }
                    : null,
            child: Text('Acessar Perfil do Administrador',
                style: TextStyle(color: _isUserAllowed([Roles.ADMIN], userLogin) ? Colors.white : Color.fromRGBO(120, 120, 120, 1),
                fontSize: 16),
                textAlign: TextAlign.center),
          ),
        ));
  }
}
