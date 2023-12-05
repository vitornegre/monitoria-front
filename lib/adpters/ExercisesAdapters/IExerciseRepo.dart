import 'package:teste_pi/adpters/ExercisesAdapters/Exercise.dart';

abstract class IExerciseRepo {
  Future<List<Exercise>> GetAllExercises();
}
