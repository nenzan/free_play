import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:free_play/app/ui/home/home_vm.dart';
import 'package:pmvvm/pmvvm.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(view: () => _HomeView(), viewModel: HomeVM());
  }
}

class _HomeView extends StatelessView<HomeVM> {
  const _HomeView({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context, HomeVM viewModel) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
            items: viewModel.imageSliders,
            carouselController: viewModel.carouselController,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
        ],
      ),
    );
  }
}
