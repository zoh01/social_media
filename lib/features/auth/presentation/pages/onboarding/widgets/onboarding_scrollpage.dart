import 'package:flutter/material.dart';

import '../../../../../../constants/helpers/helper_functions.dart';
import '../../../../../../constants/image_string.dart';
import '../../../../../../constants/sizes.dart';
import '../../../../../../constants/text_string.dart';

class OnboardingScrollPage extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const OnboardingScrollPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: ZohSizes.spaceBtwSections,
          horizontal: ZohSizes.spaceBtwItems),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(image),
            height: ZohHelperFunctions.screenHeight() * .5,
          ),
          const SizedBox(height: ZohSizes.spaceBtwItems),
          Text(
            title,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: ZohSizes.spaceBtwItems,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
