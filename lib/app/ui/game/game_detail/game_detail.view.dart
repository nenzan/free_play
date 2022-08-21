import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_twitch_player/flutter_twitch_player.dart';
import 'package:free_play/app/ui/game/game_detail/game_detail.vm.dart';
import 'package:free_play/core/style/app_color.dart';
import 'package:free_play/core/style/app_values.dart';
import 'package:free_play/core/widgets/image_url.dart';
import 'package:pmvvm/pmvvm.dart';

import 'game_detail.props.dart';

class GameDetailScreen extends StatelessWidget {
  GameDetailScreen({
    Key? key,
    required int id,
  })  : props = GameDetailProps(id: id),
        super(key: key);
  final GameDetailProps props;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
        value: props,
        child: MVVM<GameDetailVm>(
            view: () => _GameDetailScreen(), viewModel: GameDetailVm()));
  }
}

class _GameDetailScreen extends StatelessView<GameDetailVm> {
  @override
  Widget render(BuildContext context, GameDetailVm viewModel) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: 250.0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  flexibleSpace: Stack(
                    children: [
                      Positioned.fill(
                          child: ImageUrl(
                              fit: BoxFit.cover,
                              fileName:
                                  viewModel.detailGame.item?.thumbnail ?? "")),
                      Positioned(
                        bottom: -1,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(AppValues.size_16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Container(
                      width: 75,
                      height: 20,
                      margin: const EdgeInsets.only(
                          right: AppValues.size_8,
                          bottom: AppValues.size_16,
                          top: AppValues.size_16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppValues.size_16),
                        color: viewModel.detailGame.item?.status == 'Live'
                            ? AppColors.glowGreen
                            : AppColors.pink,
                      ),
                      child: Center(
                          child: Text(viewModel.detailGame.item?.status ?? '')),
                    )
                  ],
                  pinned: false,
                  floating: false,
                  snap: false,
                )
              ];
            },
            floatHeaderSlivers: true,
            body: Expanded(
                child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          height:
                              MediaQueryData.fromWindow(window).size.height),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                "\"${viewModel.detailGame.item!.shortDescription}\"",
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: AppColors.greyChartLabel),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(AppValues.size_8),
                            child: Text("Description",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppValues.size_20)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(AppValues.size_8),
                            child: Text(
                              viewModel.detailGame.item!.description,
                              style: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.blackcaption),
                            ),
                          )
                        ],
                      ),
                    )))));
  }
}
