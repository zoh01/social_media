import 'package:flutter/material.dart';
import 'package:music_app/constants/sizes.dart';
import 'package:music_app/features/auth/presentation/pages/signup/widgets/signup_form.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/helpers/helper_functions.dart';
import '../../../../../constants/text_string.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


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
                Icons.create_new_folder_outlined,
                size: ZohHelperFunctions.screenWidth() * .2,
                color: dark ? Colors.white : Colors.blueGrey,
              ),
              const SizedBox(
                height: ZohSizes.sm,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ZohTextString.signupTitle,
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

              const SignUpForm(),

              const SizedBox(
                height: ZohSizes.spaceBtwItems,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'I have an account',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

}


