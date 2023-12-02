import 'dart:convert';

import 'package:teste_pi/adpters/ExercisesAdapters/Exercise.dart';
import 'package:teste_pi/adpters/ExercisesAdapters/IExerciseRepo.dart';
import 'package:teste_pi/components/campo_exercicio.dart';

class ExerciseBackRepo implements IExerciseRepo {
  get http => null;

  @override
  Future<List<Exercise>> GetAllExercises() async {
    var client = http.Client();
    var response = await client.get(
        Uri.parse("https://monitoria-api.onrender.com/get_all_exercises"),
        headers: {});

    var json = jsonDecode(response.body);
    var exerciseListFromJson = json["body"]["ranking"];

    print(exerciseListFromJson);

    List<Exercise> listToReturn = [];

    for (var element in exerciseListFromJson) {
      listToReturn.add(Exercise(
          element["exercise_id"],
          element["correct_answer"],
          element["title"],
          element["enunciado"],
          element["creation_date"],
          element["expiration_date"]));
    }

    return listToReturn;
  }
}
