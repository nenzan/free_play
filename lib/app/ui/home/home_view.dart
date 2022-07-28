import 'package:flutter/material.dart';
import 'package:free_play/app/ui/home/home_vm.dart';
import 'package:free_play/core/style/app_color.dart';
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
  @override
  Widget render(BuildContext context, HomeVm viewModel) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: false,
              centerTitle: false,
              title: const Text('Free Play'),
              bottom: AppBar(
                title: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF21242a)),
                  child: const Center(
                    child: TextField(
                        decoration: InputDecoration(
                      hintText: 'Search for Free to Play Game ?',
                      hintStyle: TextStyle(color: AppColors.white),
                      labelStyle: TextStyle(color: AppColors.white),

                      prefix: SizedBox(
                        width: 8,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: AppColors.white,
                      ),
                    )),
                  ),
                ),
              ),
            )
          ];
        },
        body: Scaffold(),
      ),
    );
  }
}
