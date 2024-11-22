import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/constants/helpers/helper_functions.dart';
import 'package:music_app/constants/image_string.dart';
import 'package:music_app/constants/text_string.dart';
import 'package:music_app/features/auth/presentation/pages/onboarding/onboarding_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7)).then((zoh) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const OnboardingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? AppColors.darkerGrey : AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ZohSizes.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage(ZohImages.appLogo),
                width: ZohHelperFunctions.screenWidth() * .6,
              ),
              const SizedBox(
                height: ZohSizes.defaultSpace,
              ),
              SizedBox(
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 17,
                    color: dark ? AppColors.white : Colors.black,
                    fontFamily: 'IBMPlexSans',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(ZohTextString.splashText),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
