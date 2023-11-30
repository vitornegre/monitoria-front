import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLoginBackRepo.dart';

class BotaoAdm extends StatelessWidget {
  const BotaoAdm({Key? key}) : super(key: key);

  bool _isUserAllowed(List<Roles> rolesAllowed, UserLogin user) {
    return rolesAllowed.contains(user.Role);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(1, 100, 1, 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: Color.fromRGBO(131, 131, 131, 1),
          ),
          width: 350,
          height: 50,
          child: TextButton(
            onPressed:
                _isUserAllowed([Roles.ADMIN], UserLoginBackRepo.currentUser)
                    ? () {
                        Navigator.of(context).pushReplacementNamed('/admin');
                      }
                    : null,
            child: Text('Acessar Perfil do Administrador',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center),
          ),
        ));
  }
}
