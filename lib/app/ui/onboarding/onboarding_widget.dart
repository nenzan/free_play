import 'package:flutter/material.dart';
import 'package:free_play/core/style/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final String image, titleOnboarding, descOnboarding;

  const OnboardingPlaceholder(
      {Key? key,
      required this.image,
      required this.titleOnboarding,
      required this.descOnboarding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.white),
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(image),
          SizedBox(
            height: 16,
          ),
          Text(
            titleOnboarding,
            textAlign: TextAlign.center,
            style: GoogleFonts.signika(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(descOnboarding,
            textAlign: TextAlign.center,
              style: GoogleFonts.signika(
                fontSize: 14,
                color: AppColors.greyChartLabel,
              ))
        ],
      ),
    );
  }
}
