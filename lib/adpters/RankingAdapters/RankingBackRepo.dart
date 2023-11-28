import 'package:teste_pi/adpters/RankingAdapters/IRankingRepo.dart';
import 'package:teste_pi/adpters/RankingAdapters/RankingUser.dart';
import 'package:http/http.dart' as http;

class RankingBackRepo implements IRankingRepo {
  final client = http.Client();

  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }

  @override
  Future<List<RankingUser>> GetRanking() {
    throw UnimplementedError();
  }
}
