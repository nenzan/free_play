import 'package:flutter/material.dart';
import 'package:free_play/app/ui/onboarding/onboarding_vm.dart';
import 'package:free_play/app/ui/onboarding/onboarding_widget.dart';
import 'package:free_play/core/assets/app_images.dart';
import 'package:free_play/core/style/app_color.dart';
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
                    image: AppImages.imgOnboarding,
                    titleOnboarding: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    descOnboarding: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
                OnboardingPlaceholder(
                    image: AppImages.imgOnboarding,
                    titleOnboarding: "Onboarding 2 Title",
                    descOnboarding: "Onboarding 3 Description"),
                OnboardingPlaceholder(
                    image: AppImages.imgOnboarding,
                    titleOnboarding: "Onboarding 2 Title",
                    descOnboarding: "Onboarding 3 Description")
              ],
            ),
            Positioned(
              bottom: 60,
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
          ],
        ),
      ),
    );
  }
}
