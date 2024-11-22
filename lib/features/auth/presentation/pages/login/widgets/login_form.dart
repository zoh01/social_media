import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/auth/presentation/bloc/auth_cubit.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/helpers/helper_functions.dart';
import '../../../../../../constants/sizes.dart';
import '../../../../../../constants/text_string.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  bool _isSecuredPassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final String email = emailController.text;
    final String password = passwordController.text;

    // Auth Cubit
    final authCubit = context.read<AuthCubit>();

    // Ensure that Email & Password not empty
    if (email.isNotEmpty && password.isNotEmpty) {
      // Login
      authCubit.login(email, password);
    }

    // Display error if some fields are empty
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter both email & password')));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          /// Email
          TextFormField(
            controller: emailController,
            // validator: (zoh) {
            //   if (zoh!.isEmpty) {
            //     return "${ZohTextString.email} is missing";
            //   }
            //   return null;
            // },
            cursorColor: dark ? Colors.white : Colors.black,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontFamily: 'Poppins'),
            decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(
                  Icons.email,
                  color: dark ? Colors.white : Colors.black,
                ),
                labelText: ZohTextString.email,
                labelStyle: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                    fontFamily: 'Poppins'),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: dark ? Colors.white : Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: dark ? Colors.white : Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0)))),
          ),
          const SizedBox(
            height: ZohSizes.defaultSpace,
          ),

          /// Password
          TextFormField(
            controller: passwordController,
            // validator: (zoh) {
            //   if (zoh!.isEmpty) {
            //     return "${ZohTextString.password} is missing";
            //   }
            //   return null;
            // },
            keyboardType: TextInputType.visiblePassword,
            cursorColor: dark ? Colors.white : Colors.black,
            style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontFamily: 'Poppins'),
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(
                Icons.password,
                color: dark ? Colors.white : Colors.black,
              ),
              suffixIcon: togglePassword(),
              labelText: ZohTextString.password,
              labelStyle: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontFamily: 'Poppins'),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: dark ? Colors.white : Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: dark ? Colors.white : Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
            ),
            obscureText: _isSecuredPassword,
          ),
          const SizedBox(
            height: ZohSizes.spaceBtwSections * 1.2,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                textStyle: const TextStyle(fontSize: 28),
                minimumSize: const Size(0, 60),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IBMPlexSans',
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecuredPassword = !_isSecuredPassword;
          });
        },
        icon: _isSecuredPassword
            ? Icon(Icons.visibility_off,
                color: ZohHelperFunctions.isDarkMode(context)
                    ? Colors.white
                    : Colors.black)
            : Icon(Icons.visibility,
                color: ZohHelperFunctions.isDarkMode(context)
                    ? Colors.white
                    : Colors.black));
  }
}
