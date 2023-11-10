import 'package:teste_pi/adpters/IRankingRepo.dart';
import 'package:teste_pi/adpters/RankingUser.dart';

class RankingRepoMock implements IRankingRepo {
  List<RankingUser> allRankingUsers = [
    RankingUser("Heer Einstein", 1, 100),
    RankingUser("Lucas Deuz", 2, 90),
    RankingUser("Laurinha", 3, 80),
    RankingUser("Gollum", 4, 70),
    RankingUser("Vitin", 5, 60),
    RankingUser("Bidetti", 6, 10),
    RankingUser("Bilbo", 7, 0),
    RankingUser("Gandalf", 8, 0),
    RankingUser("Saruman", 9, 0),
    RankingUser("Sauron", 10, 0),
  ];

  @override
  List<RankingUser> GetRanking(String userId) {
    return allRankingUsers;
  }
}
