import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:free_play/app/ui/home/home_vm.dart';
import 'package:free_play/res/app_colors.dart';
import 'package:free_play/res/app_values.dart';
import 'package:pmvvm/pmvvm.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(view: () => _HomeView(), viewModel: HomeVM());
  }
}

class _HomeView extends StatelessView<HomeVM> {
  const _HomeView({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(BuildContext context, HomeVM viewModel) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: AppValues.size_20,
          ),
          CarouselSlider(
            items: viewModel.imageSliders,
            carouselController: viewModel.carouselController,
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 0.9,
              aspectRatio: 16 / 9,
            ),
          ),
          SizedBox(
            height: AppValues.size_20,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppValues.margin,
              right: AppValues.margin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                  value: viewModel.selectedValue,
                  items: viewModel.dropdownItems,
                  style: const TextStyle(color: AppColors.colorPrimary),
                  onChanged: (String? value) {
                    viewModel.selectedValue = value ?? '';
                    viewModel.notifyListeners();
                  },
                ),
                DropdownButton(
                  value: viewModel.genreSelectedValue,
                  items: viewModel.genreDropdownItems,
                  style: const TextStyle(color: AppColors.colorPrimary),
                  onChanged: (String? value) {
                    viewModel.genreSelectedValue = value ?? '';
                    viewModel.notifyListeners();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
