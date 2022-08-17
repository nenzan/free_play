import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitch_player/flutter_twitch_player.dart';
import 'package:free_play/app/ui/game/game_detail/game_detail.view.dart';
import 'package:free_play/app/ui/home/data/model/game_detail_model.dart';
import 'package:free_play/app/ui/home/data/model/games_list_model.dart';
import 'package:free_play/app/ui/home/home.vm.dart';
import 'package:free_play/core/data/enum/view_type_enum.dart';
import 'package:free_play/core/data/model/setmodellist.dart';
import 'package:free_play/core/style/app_color.dart';
import 'package:free_play/core/style/app_values.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmvvm/pmvvm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<HomeVm>(
      view: () => _HomeScreenView(),
      viewModel: HomeVm(),
    );
  }
}

class _HomeScreenView extends StatelessView<HomeVm> {
  int _crossAxisCount = 2;
  double _aspectRatio = 1.5;
  ViewType _viewType = ViewType.grid;

  @override
  Widget render(BuildContext context, HomeVm viewModel) {
    final List<Widget> imageSliders = viewModel.topFiveImage
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    ],
                  )),
            ))
        .toList();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: false,
              pinned: true,
              snap: false,
              centerTitle: false,
              backgroundColor: const Color(0xFF313640),
              title: const Text('Free Play'),
              actions: [
                Container(
                  width: 200,
                  height: 40,
                  margin: const EdgeInsets.only(
                      right: AppValues.size_8,
                      bottom: AppValues.size_8,
                      top: AppValues.size_8),
                  padding: const EdgeInsets.only(bottom: AppValues.size_4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppValues.size_16),
                      color: const Color(0xFF21242a)),
                  child: Center(
                    child: TextFormField(
                        style: const TextStyle(color: AppColors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Here...',
                          hintStyle: TextStyle(color: AppColors.greyChartLabel),
                          labelStyle: TextStyle(color: AppColors.white),
                          prefix: SizedBox(
                            width: AppValues.size_16,
                          ),
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: AppColors.white,
                          ),
                        )),
                  ),
                )
              ],
            )
          ];
        },
        body: Container(
            color: const Color(0xFF21242a),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: AppValues.size_8,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: imageSliders,
                ),
                const SizedBox(
                  height: AppValues.size_8,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Streamer',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.signika(
                            fontSize: 20,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search_outlined,
                            color: AppColors.white),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(AppValues.size_16,
                        AppValues.size_16, AppValues.size_16, AppValues.size_4),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 220,
                    child: TwitchPlayerIFrame(
                      controller: viewModel.twitchController,
                      channel: "loltyler1",
                      borderRadius: BorderRadius.circular(AppValues.size_8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Free Game',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.signika(
                            fontSize: 20,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(
                            _viewType == ViewType.list
                                ? Icons.grid_view_sharp
                                : Icons.list_rounded,
                            color: AppColors.white),
                        onPressed: () {
                          if (_viewType == ViewType.list) {
                            _crossAxisCount = 2;
                            _aspectRatio = 1.5;
                            _viewType = ViewType.grid;
                          } else {
                            _crossAxisCount = 1;
                            _aspectRatio = 5;
                            _viewType = ViewType.list;
                          }
                          viewModel.notifyListeners();
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: AppValues.size_8,
                            right: AppValues.size_16,
                            bottom: AppValues.size_16),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: _crossAxisCount,
                          childAspectRatio: _aspectRatio,
                          children: List.generate(
                              viewModel.listGames.items!.length, (index) {
                            return GestureDetector(
                              child: getGridItem(viewModel.listGames, index),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GameDetailScreen()));
                              },
                            );
                          }),
                        )))
              ],
            )),
      ),
    );
  }

  GridTile getGridItem(SetModelList<GamesListModel> data, int index) {
    return GridTile(
      child: (_viewType == ViewType.list)
          ? Container(
              margin: const EdgeInsets.only(top: AppValues.size_8),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: AppColors.greyChartLabel),
                padding: const EdgeInsets.all(AppValues.size_4),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(AppValues.size_2),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppValues.size_4),
                          child: Image.network(
                            data.items?.elementAt(index).thumbnail ?? '',
                          )),
                    ),
                    const SizedBox(
                      width: AppValues.size_8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Text(
                          data.items?.elementAt(index).title ?? '',
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whitesmokke,
                              overflow: TextOverflow.ellipsis),
                        )),
                        Flexible(
                            child: Text(
                          data.items?.elementAt(index).developer ?? '',
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.whitesmokke,
                              overflow: TextOverflow.ellipsis),
                        )),
                        Flexible(
                            child: Text(
                          data.items?.elementAt(index).platform ?? '',
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.whitesmokke,
                              overflow: TextOverflow.ellipsis),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(AppValues.size_8),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppValues.size_4),
                      child: Image.network(
                        data.items?.elementAt(index).thumbnail ?? '',
                      )),
                )),
                Text(
                  data.items?.elementAt(index).title ?? '',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
    );
  }
}

class ScreenArguments {
  final GameDetailModel data;

  ScreenArguments(this.data);
}
