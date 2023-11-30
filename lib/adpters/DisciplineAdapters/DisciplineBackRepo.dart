import 'dart:convert';

import 'package:teste_pi/adpters/DisciplineAdapters/Discipline.dart';
import 'package:teste_pi/adpters/DisciplineAdapters/IDisciplineRepo.dart';
import 'package:teste_pi/adpters/RankingAdapters/IRankingRepo.dart';
import 'package:teste_pi/adpters/RankingAdapters/RankingUser.dart';
import 'package:http/http.dart' as http;

class DisciplineBackRepo implements IDisciplineRepo {
  @override
  Future<Discipline> CadastrarDiscipline(Discipline discipline) async {
    var client = http.Client();
    var url = Uri.parse("https://monitoria-api.onrender.com/create_discipline");
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(discipline.toJson()));

    return discipline;
  }
}
