import 'package:flutter/material.dart';
import 'package:flutter_twitch_player/flutter_twitch_player.dart';
import 'package:free_play/app/ui/home/data/model/games_list_model.dart';
import 'package:free_play/app/ui/home/data/model/stream_model.dart';
import 'package:free_play/app/ui/home/data/model/stream_response_model.dart';
import 'package:free_play/app/ui/home/data/repo/home_content_repo.dart';
import 'package:free_play/core/data/model/setmodel.dart';
import 'package:free_play/core/data/model/setmodellist.dart';
import 'package:pmvvm/pmvvm.dart';

class HomeVm extends ViewModel with HomeContentRepo {
  SetModelList<GamesListModel> listGames = SetModelList<GamesListModel>();
  SetModelList<StreamModel> listStream = SetModelList<StreamModel>();
  List<String> topFiveImage = [];
  TwitchController twitchController = TwitchController();
  late String topStreamer;

  @override
  void init() {
    super.init();

    getGamesList();
    getStreamsist();
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

  Future<void> getStreamsist() async {
    listStream.loading = true;
    notifyListeners();
    listStream.items = {};

    try {
      final res = await repoGetListStream();

      if (res.data.isNotEmpty) {
        listStream.items?.addAll(res.data);
        topStreamer = listStream.items?.elementAt(0).userName ?? 'dota2ti';
      }
    } catch (e) {
      listStream.error = e.toString();
      debugPrint(e.toString());
    }

    listStream.loading = false;
    notifyListeners();
  }

  getTopFiveImage(Set<GamesListModel> data) {
    for (var i = 0; i < 5; i++) {
      topFiveImage.add(data.elementAt(i).thumbnail);
    }
    notifyListeners();
  }
}
