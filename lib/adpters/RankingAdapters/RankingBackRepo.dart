import 'dart:convert';

import 'package:teste_pi/adpters/RankingAdapters/IRankingRepo.dart';
import 'package:teste_pi/adpters/RankingAdapters/RankingUser.dart';
import 'package:http/http.dart' as http;

class RankingBackRepo implements IRankingRepo {
  @override
  Future<List<RankingUser>> GetRanking() async {
    var client = http.Client();
    var response = await client
        .get(Uri.parse("https://monitoria-api.onrender.com/get_ranking"), headers: {});

    var json = jsonDecode(response.body);
    var rankingListFromJson = json["body"]["ranking"];

    print(rankingListFromJson);

    List<RankingUser> listToReturn = [];

    for (var element in rankingListFromJson) {
      listToReturn.add(RankingUser(element["name"], element["email"],
          element["rank"], element["points"]));
    }

    return listToReturn;
  }
}
