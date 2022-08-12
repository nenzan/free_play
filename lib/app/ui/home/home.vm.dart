import 'package:flutter/material.dart';
import 'package:free_play/app/ui/home/data/model/games_list_model.dart';
import 'package:free_play/app/ui/home/data/repo/home_content_repo.dart';
import 'package:free_play/core/data/model/setmodellist.dart';
import 'package:pmvvm/pmvvm.dart';

class HomeVm extends ViewModel with HomeContentRepo {
  SetModelList<GamesListModel> listGames = SetModelList<GamesListModel>();

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
        // print(listGames.items?.elementAt(0).title);
      }
    } catch (e) {
      // e.printError();
      listGames.error = e.toString();
      // AppSnackbar.error("Error", "Failed to get list product, try again later");
      debugPrint(e.toString());
    }

    listGames.loading = false;
    notifyListeners();
  }
}
