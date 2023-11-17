import 'package:teste_pi/adpters/RankingAdapters/RankingUser.dart';

abstract class IRankingRepo {
  List<RankingUser> GetRanking(String userId);
}
