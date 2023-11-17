import 'package:teste_pi/adpters/RankingAdapters/IRankingRepo.dart';
import 'package:teste_pi/adpters/RankingAdapters/RankingUser.dart';

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
    RankingUser("Bilbo", "bilbo@maua.br", 11, 0),
    RankingUser("Gandalf", "ganfalf@maua.br", 12, 0),
    RankingUser("Saruman", "saruman@maua.br", 13, 0),
    RankingUser("Sauron", "sauron@gmail.com", 14, 0),
    RankingUser("Bilbo", "bilbo@maua.br", 15, 0),
    RankingUser("Gandalf", "ganfalf@maua.br", 16, 0),
    RankingUser("Saruman", "saruman@maua.br", 17, 0),
    RankingUser("Sauron", "sauron@gmail.com", 18, 0),
    RankingUser("Bilbo", "bilbo@maua.br", 19, 0),
    RankingUser("Gandalf", "ganfalf@maua.br", 20, 0),
    RankingUser("Saruman", "saruman@maua.br", 21, 0),
    RankingUser("Sauron", "sauron@gmail.com", 22, 0),
    RankingUser("Bilbo", "bilbo@maua.br", 23, 0),
    RankingUser("Gandalf", "ganfalf@maua.br", 24, 0),
    RankingUser("Saruman", "saruman@maua.br", 25, 0),
    RankingUser("Sauron", "sauron@gmail.com", 26, 0),
  ];

  @override
  List<RankingUser> GetRanking(String userId) {
    return allRankingUsers;
  }
}
