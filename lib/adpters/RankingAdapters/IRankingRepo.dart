import 'package:teste_pi/adpters/RankingAdapters/RankingUser.dart';

abstract class IRankingRepo {
  Future<List<RankingUser>> GetRanking();
}
