import 'package:teste_pi/adpters/RankingAdapters/IRankingRepo.dart';
import 'package:teste_pi/adpters/RankingAdapters/RankingUser.dart';

class RankingRepoMock implements IRankingRepo {
  List<RankingUser> allRankingUsers = [
    RankingUser("Heer Einstein", 1, 100),
    RankingUser("Lucas Deuz", 2, 90),
    RankingUser("Laurinha", 3, 80),
    RankingUser("Gollum", 4, 70),
    RankingUser("Vitin", 5, 60)
  ];

  @override
  List<RankingUser> GetRanking(String userId) {
    return allRankingUsers;
  }
}
