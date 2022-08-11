import 'package:free_play/app/ui/home/data/model/games_list_model.dart';
import 'package:free_play/app/ui/home/data/network/home_content_network.dart';

class HomeContentRepo {
  final _myNetwork = HomeContentNetwork();

  Future<List<GamesListModel>> repoGetListGame() async {
    try {
      return await _myNetwork.apiGetListGames();
    } catch (e) {
      rethrow;
    }
  }
}