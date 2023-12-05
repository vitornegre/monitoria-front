import 'dart:convert';

import 'package:teste_pi/adpters/AnswerAdapters/Answer.dart';
import 'package:teste_pi/adpters/AnswerAdapters/IAnswerRepo.dart';
import 'package:http/http.dart' as http;

class AnswerBackRepo implements IAnswerRepo {
  @override
  Future<List<Answer>> GetAnswers({required String exercise_id}) async {
    var client = http.Client();
    var response = await client.get(
        Uri.parse(
            "https://monitoria-api.onrender.com/get_answers?exercise_id=$exercise_id"),
        headers: {});
    var json = jsonDecode(response.body);
    var answerListFromJson = json["body"]["answers"];

    print(answerListFromJson);

    List<Answer> listToReturn = [];

    for (var element in answerListFromJson) {
      listToReturn.add(Answer(element["exercise_id"].toString(),
          element["email"], element["content"], element["is_right"]));
    }

    return listToReturn;
  }

  @override
  Future<Answer> UpdateAnswer(
      {required String exercise_id, required int isRight}) async {
    return Answer("adasd", "asdsda", "asddas", 0);
  }

  @override
  Future<Answer> CreateAnswer(Answer answer) async {
    var client = http.Client();
    var requestBody = jsonEncode({
      "exercise_id": answer.exercise_id.toString(),
      "email": answer.email,
      "content": answer.content,
      "is_right": answer.is_right
    });
    var response = await client.post(
        Uri.parse("https://monitoria-api.onrender.com/create_answer"),
        headers: {"Content-Type": "application/json"},
        body: requestBody);

    return answer;
  }
}
