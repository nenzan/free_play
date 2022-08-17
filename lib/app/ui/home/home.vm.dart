import 'package:flutter/material.dart';
import 'package:flutter_twitch_player/flutter_twitch_player.dart';
import 'package:free_play/app/ui/home/data/model/games_list_model.dart';
import 'package:free_play/app/ui/home/data/repo/home_content_repo.dart';
import 'package:free_play/core/data/model/setmodellist.dart';
import 'package:pmvvm/pmvvm.dart';

class HomeVm extends ViewModel with HomeContentRepo {
  SetModelList<GamesListModel> listGames = SetModelList<GamesListModel>();
  List<String> topFiveImage = [];
  TwitchController twitchController = TwitchController();

  @override
  void init() {
    super.init();

    getGamesList();
  }

  Future<void> getGamesList() async {
    listGames.loading = true;
    notifyListeners();
    listGames.items = {};

    try {
      final res = await repoGetListGame();

      if (res != null && res != 0) {
        listGames.items?.addAll(res);
        getTopFiveImage(listGames.items!);
      }
    } catch (e) {
      listGames.error = e.toString();
      debugPrint(e.toString());
    }

    listGames.loading = false;
    notifyListeners();
  }

  getTopFiveImage(Set<GamesListModel> data) {
    for (var i = 0; i < 5; i++) {
      topFiveImage.add(data.elementAt(i).thumbnail);
    }
    notifyListeners();
  }
}
