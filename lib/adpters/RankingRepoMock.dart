import 'package:teste_pi/adpters/IRankingRepo.dart';
import 'package:teste_pi/adpters/RankingUser.dart';

class RankingRepoMock implements IRankingRepo {
  List<RankingUser> allRankingUsers = [
    RankingUser("Heer Einstein", "aaaa@hotmail.com", 1, 100),
    RankingUser("Lucas Deuz", "lucasduez@gmail.com", 2, 90),
    RankingUser("Laurinha", "laurinha@gmail.com", 3, 80),
    RankingUser("Gollum", "gollum@gmail.com", 4, 70),
    RankingUser("Vitin", "22.01049-0@maua.br", 5, 60),
    RankingUser("Bidetti", "22.01019-0@maua.br", 6, 10),
    RankingUser("Bilbo", "bilbo@maua.br", 7, 0),
    RankingUser("Gandalf", "ganfalf@maua.br", 8, 0),
    RankingUser("Saruman", "saruman@maua.br", 9, 0),
    RankingUser("Sauron", "sauron@gmail.com", 10, 0),
  ];

  @override
  List<RankingUser> GetRanking(String userId) {
    return allRankingUsers;
  }
}
