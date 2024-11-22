import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/helpers/helper_functions.dart';
import '../../../../../../constants/sizes.dart';


class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: ZohHelperFunctions.screenHeight() * .15,
      left: ZohSizes.defaultSpace,
      right: ZohSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 60),
            backgroundColor: AppColors.primaryColor,
            shadowColor: AppColors.primaryColor),
        child: const Text(
          'Create Account',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
    );
  }
}