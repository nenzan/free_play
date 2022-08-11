import 'package:free_play/app/ui/home/data/model/games_list_model.dart';
import 'package:free_play/core/data/network/app_network.dart';

class HomeContentNetwork {
  Future<List<GamesListModel>> apiGetListGames() async {
    try {
      final res = await AppNetworkClient.get(path: 'games');
      return (res.data as List)
          .map((x) => GamesListModel.fromJson(x))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
