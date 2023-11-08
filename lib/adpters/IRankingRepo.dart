import 'package:teste_pi/adpters/RankingUser.dart';

abstract class IRankingRepo {
  List<RankingUser> GetRanking(String userId);
}
