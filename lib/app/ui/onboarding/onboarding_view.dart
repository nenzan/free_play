import 'package:flutter/material.dart';
import 'package:free_play/app/ui/onboarding/onboarding_vm.dart';
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
              children: <Widget>[
                Container(
                    child: OnboardingPlaceholder(
                        titleOnboarding: "Onboarding 1 Title",
                        descOnboarding: "Onboarding 1 Description")),
                Container(
                    child: OnboardingPlaceholder(
                        titleOnboarding: "Onboarding 2 Title",
                        descOnboarding: "Onboarding 3 Description")),
                Container(
                    child: OnboardingPlaceholder(
                        titleOnboarding: "Onboarding 2 Title",
                        descOnboarding: "Onboarding 3 Description"))
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
                  SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 1,
                    currentIndex: viewModel.currentIndex.value,
                  ),
                  SizedBox(
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

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;

  const Indicator({required this.currentIndex, required this.positionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          color:
              positionIndex == currentIndex ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}

class OnboardingPlaceholder extends StatelessWidget {
  final String titleOnboarding, descOnboarding;

  const OnboardingPlaceholder(
      {Key? key, required this.titleOnboarding, required this.descOnboarding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.network('https://picsum.photos/250?image=9'),
          SizedBox(
            height: 16,
          ),
          Text(titleOnboarding),
          SizedBox(
            height: 8,
          ),
          Text(descOnboarding)
        ],
      ),
    );
  }
}
