import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:free_play/app/ui/game/game_detail/game_detail.vm.dart';
import 'package:free_play/core/style/app_color.dart';
import 'package:pmvvm/pmvvm.dart';

class GameDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MVVM<GameDetailVm>(
        view: () => _GameDetailScreen(), viewModel: GameDetailVm());
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
                  expandedHeight: 300.0,
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: Colors.white,
                    ),
                  ),
                  flexibleSpace: Stack(
                    children: [
                      Positioned(
                        bottom: -1,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      child: Stack(
                        children: [
                          Container(
                            child: Text('test detail game'),
                          )
                        ],
                      ),
                    )))));
  }
}
