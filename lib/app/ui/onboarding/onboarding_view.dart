import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_play/app/ui/home/home.view.dart';
import 'package:free_play/app/ui/onboarding/onboarding_vm.dart';
import 'package:free_play/app/ui/onboarding/widget/onboarding_widget.dart';
import 'package:free_play/core/assets/app_images.dart';
import 'package:free_play/core/style/app_color.dart';
import 'package:free_play/core/style/app_values.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmvvm/pmvvm.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<OnboardingVm>(
        view: () => _OnboardingScreenView(), viewModel: OnboardingVm());
  }
}

class _OnboardingScreenView extends StatelessView<OnboardingVm> {
  @override
  Widget render(BuildContext context, OnboardingVm viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              onPageChanged: viewModel.onChangedFunction,
              controller: viewModel.pageController,
              children: const <Widget>[
                OnboardingPlaceholder(
                    image: AppImages.imgOnboarding1,
                    titleOnboarding: "Find Free Game",
                    descOnboarding:
                        "Temukan berbagai informasi game gratis yang bisa kamu mainkan di platform kesayanganmu"),
                OnboardingPlaceholder(
                    image: AppImages.imgOnboarding2,
                    titleOnboarding: "Choose The Game",
                    descOnboarding:
                        "Pilih game yang ingin kamu tahu informasinya, kamu bisa pilih berdasarkan genre kesukaanmu"),
                OnboardingPlaceholder(
                    image: AppImages.imgOnboarding3,
                    titleOnboarding: "See The Detail",
                    descOnboarding:
                        "Dapatkan informasi lengkap tentang game yang kamu suka agar kamu tahu apakah game ini cocok untukmu")
              ],
            ),
            Positioned(
              bottom: 60,
              left: 32,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Indicator(
                    positionIndex: 0,
                    currentIndex: viewModel.currentIndex.value,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 1,
                    currentIndex: viewModel.currentIndex.value,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 2,
                    currentIndex: viewModel.currentIndex.value,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              right: 32,
              child: Row(
                children: [
                  Visibility(
                      visible: viewModel.currentIndex.value > 0 ? true : false,
                      child: GestureDetector(
                          onTap: () {
                            if (viewModel.currentIndex.value == 2) {
                              viewModel.onChangedFunction(1);
                              viewModel.pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            } else if (viewModel.currentIndex.value == 1) {
                              viewModel.onChangedFunction(0);
                              viewModel.pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            }
                          },
                          child: Text(
                            'Back',
                            style: GoogleFonts.signika(
                                fontSize: AppValues.size_16,
                                color: AppColors.mainColor),
                          ))),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                      onTap: () {
                        if (viewModel.currentIndex.value == 0) {
                          viewModel.onChangedFunction(1);
                          viewModel.pageController.animateToPage(1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        } else if (viewModel.currentIndex.value == 1) {
                          viewModel.onChangedFunction(2);
                          viewModel.pageController.animateToPage(2,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                      },
                      child: Text(
                        viewModel.currentIndex.value == 2 ? 'Finish' : 'Next',
                        style: GoogleFonts.signika(
                            fontSize: AppValues.size_16,
                            color: AppColors.mainColor),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
