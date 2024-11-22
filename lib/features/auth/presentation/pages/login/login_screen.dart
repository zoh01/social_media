import 'package:flutter/material.dart';
import 'package:music_app/constants/sizes.dart';
import 'package:music_app/features/auth/presentation/pages/login/widgets/login_form.dart';

import '../../../../../constants/helpers/helper_functions.dart';
import '../../../../../constants/text_string.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ZohSizes.defaultSpace),
            child: Column(
              children: [
                Icon(
                  Icons.lock_open_rounded,
                  size: ZohHelperFunctions.screenWidth() * .3,
                  color: dark ? Colors.white : Colors.blueGrey,
                ),
                const SizedBox(
                  height: ZohSizes.sm,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ZohTextString.loginTitle,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: dark ? Colors.white : Colors.black,
                          fontSize: ZohSizes.defaultSpace),
                    ),
                    const SizedBox(
                      height: ZohSizes.sm,
                    ),
                    const Text(
                      ZohTextString.loginSubTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: ZohSizes.spaceBtwSections,
                ),
                const LoginForm(),
                const SizedBox(
                  height: ZohSizes.spaceBtwSections,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    ZohTextString.notMember,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


