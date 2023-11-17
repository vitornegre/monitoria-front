import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BotoesMenu extends StatelessWidget {
  const BotoesMenu({Key? key}) : super(key: key);

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
                  color: Color.fromRGBO(26, 151, 221, 1),
                ),
                width: 250,
                height: 250,
                child: TextButton(
                    onPressed: () {
                      _launchInWebView(Uri.parse("https://bit.ly/monitoriacicsin"));
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
                  color: Color.fromRGBO(160, 58, 58, 1),
                ),
                width: 250,
                height: 250,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/exercicios');
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
                  color: Color.fromRGBO(74, 182, 98, 1),
                ),
                width: 250,
                height: 250,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/ranking');
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
                  color: Color.fromRGBO(182, 171, 74, 1),
                ),
                width: 250,
                height: 250,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/monitor');
                    },
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
