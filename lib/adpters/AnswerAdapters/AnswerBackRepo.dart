import 'dart:convert';

import 'package:teste_pi/adpters/AnswerAdapters/Answer.dart';
import 'package:teste_pi/adpters/AnswerAdapters/IAnswerRepo.dart';
import 'package:http/http.dart' as http;

class AnswerBackRepo implements IAnswerRepo {
  @override
  Future<List<Answer>> GetAnswers({required String exercise_id}) async {
    var client = http.Client();
    var response = await client.get(
        Uri.parse("https://monitoria-api.onrender.com/get_answers?exercise_id=$exercise_id"),
        headers: {});
  var json = jsonDecode(response.body);
  var answerListFromJson = json["body"]["answers"];

  print(answerListFromJson);

  List<Answer> listToReturn = [];

  for (var element in answerListFromJson) {
    listToReturn.add(Answer(element["exercise_id"], element["email"], element["content"], element["is_right"]));
  }

  return listToReturn;
  }
}