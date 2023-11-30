

import 'package:teste_pi/adpters/AnswerAdapters/Answer.dart';

abstract class IAnswerRepo {
  Future<List<Answer>> GetAnswers({required String exercise_id});
}
