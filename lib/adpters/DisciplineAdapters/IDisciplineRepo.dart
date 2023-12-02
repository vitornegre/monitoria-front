import 'package:teste_pi/adpters/DisciplineAdapters/Discipline.dart';

abstract class IDisciplineRepo {
  Future<Discipline>CadastrarDiscipline(Discipline discipline);
}
