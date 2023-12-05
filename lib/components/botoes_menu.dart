import 'package:flutter/material.dart';
import 'package:teste_pi/adpters/LoginAdapters/UserLogin.dart';
import 'package:url_launcher/url_launcher.dart';

class BotoesMenu extends StatelessWidget {
  final UserLogin? userLogin;
  const BotoesMenu({Key? key, this.userLogin}) : super(key: key);

  bool _isUserAllowed(List<Roles> rolesAllowed, UserLogin? user) {
    if (user == null) {
      return false;
    }
    return rolesAllowed.contains(user.Role);
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _launchInWebView(Uri url) async {
      if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
        throw Exception('Could not launch $url');
      }
    }

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: _isUserAllowed(
                          [Roles.ADMIN, Roles.MONITOR, Roles.TEACHER, Roles.STUDENT],
                          userLogin)
                      ? Color.fromRGBO(26, 151, 221, 1)
                      : Color.fromRGBO(159, 200, 222, 1),
                ),
                width: 250,
                height: 250,
                child: TextButton(
                    onPressed: () {
                      _isUserAllowed(
                              [Roles.ADMIN, Roles.MONITOR, Roles.TEACHER, Roles.STUDENT],
                              userLogin)
                          ? _launchInWebView(
                          Uri.parse("https://bit.ly/monitoriacicsin"))
                          : null;
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today,
                            color: Colors.white, size: 70),
                        Text('Horário dos Monitores',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                            ),
                            textAlign: TextAlign.center),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: _isUserAllowed(
                          [Roles.ADMIN, Roles.MONITOR, Roles.TEACHER, Roles.STUDENT],
                          userLogin)
                      ? Color.fromRGBO(160, 58, 58, 1)
                      : Color.fromRGBO(168, 129, 129, 1),
                ),
                width: 250,
                height: 250,
                child: TextButton(
                    onPressed: () {
                      _isUserAllowed(
                              [Roles.ADMIN, Roles.MONITOR, Roles.TEACHER, Roles.STUDENT],
                              userLogin)
                          ? Navigator.pushNamed(context, '/exercicios')
                          : null;

                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.list_alt, color: Colors.white, size: 70),
                        Text('Exercícios',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                            ),
                            textAlign: TextAlign.center),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: _isUserAllowed(
                          [Roles.ADMIN, Roles.MONITOR, Roles.TEACHER, Roles.STUDENT],
                          userLogin)
                      ? Color.fromRGBO(74, 182, 98, 1)
                      : Color.fromRGBO(158, 197, 166, 1),
                ),
                width: 250,
                height: 250,
                child: TextButton(
                    onPressed: () {
                      _isUserAllowed(
                              [Roles.ADMIN, Roles.MONITOR, Roles.TEACHER, Roles.STUDENT],
                              userLogin)
                          ? Navigator.of(context).pushReplacementNamed('/ranking')
                          : null;
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 70),
                        Text('Ranking',
                            style: TextStyle(color: Colors.white, fontSize: 26),
                            textAlign: TextAlign.center),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: _isUserAllowed(
                          [Roles.ADMIN, Roles.MONITOR, Roles.TEACHER],
                          userLogin)
                      ? Color.fromRGBO(182, 171, 74, 1)
                      : Color.fromRGBO(193, 188, 151, 1),
                ),
                width: 250,
                height: 250,
                child: TextButton(
                    onPressed: _isUserAllowed(
                            [Roles.ADMIN, Roles.MONITOR, Roles.TEACHER],
                            userLogin)
                        ? () {
                            Navigator.of(context)
                                .pushReplacementNamed('/monitor');
                          }
                        : null,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: Colors.white, size: 70),
                        Text('Área do Monitor',
                            style: TextStyle(color: Colors.white, fontSize: 26),
                            textAlign: TextAlign.center),
                      ],
                    )),
              ),
            ),
          ],
        ));
  }
}
