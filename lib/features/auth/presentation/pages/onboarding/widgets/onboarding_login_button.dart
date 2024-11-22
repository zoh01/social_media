import 'package:flutter/material.dart';
import 'package:music_app/features/auth/presentation/pages/login/login_screen.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/helpers/helper_functions.dart';
import '../../../../../../constants/sizes.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: ZohHelperFunctions.screenHeight() * .05,
      left: ZohSizes.defaultSpace,
      right: ZohSizes.defaultSpace,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen(),
            ),
          );
        },
        style: OutlinedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 60),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(
          'I have an account',
          style: TextStyle(
              color: dark ? AppColors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
    );
  }
}
