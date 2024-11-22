import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/constants/helpers/helper_functions.dart';
import 'package:music_app/constants/image_string.dart';
import 'package:music_app/constants/text_string.dart';
import 'package:music_app/features/auth/presentation/pages/onboarding/widgets/onboarding_login_button.dart';
import 'package:music_app/features/auth/presentation/pages/onboarding/widgets/onboarding_scrollpage.dart';
import 'package:music_app/features/auth/presentation/pages/onboarding/widgets/onboarding_signup_button.dart';

import '../../../../../constants/colors.dart';
import 'bloc/onboarding_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Stack(
            children: [
              PageView(
                onPageChanged: (zoh) {
                  state.page = zoh;
                  BlocProvider.of<OnboardingBloc>(context).add(OnboardingEvent());
                },
                children: const [
                  OnboardingScrollPage(
                    image: ZohImages.discoverMusic,
                    title: ZohTextString.onBoardingTitle1,
                    subTitle: ZohTextString.onBoardingSubTitle1,
                  ),
                  OnboardingScrollPage(
                    image: ZohImages.organizeMusic,
                    title: ZohTextString.onBoardingTitle2,
                    subTitle: ZohTextString.onBoardingSubTitle2,
                  ),
                  OnboardingScrollPage(
                    image: ZohImages.playMusic,
                    title: ZohTextString.onBoardingTitle3,
                    subTitle: ZohTextString.onBoardingSubTitle3,
                  ),
                ],
              ),

              /// Smooth Page Indicator
              Positioned(
                left: ZohHelperFunctions.screenWidth() * .4,
                bottom: ZohHelperFunctions.screenHeight() * .25,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: state.page,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                      color: AppColors.greyColor,
                      activeColor: AppColors.primaryColor.withOpacity(0.6),
                      spacing: const EdgeInsets.all(5),
                      size: const Size.square(9.0),
                      activeSize: const Size(30.0, 10.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),

              /// Create Account Button
              const SignUpButton(),

              /// Login Button
              const LoginButton(),
            ],
          );
        },
      ),
    );
  }
}
