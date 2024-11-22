import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/constants/helpers/helper_functions.dart';
import 'package:music_app/features/auth/presentation/bloc/auth_cubit.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/sizes.dart';
import '../../../../../../constants/text_string.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isSecuredPassword = true;
  bool _isSecuredZoh = true;
  bool? isChecked = false;
  final zohKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() {
    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    /// Auth Cubit
    final authCubit = context.read<AuthCubit>();

    /// Ensure that the fields are not empty
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      /// Ensure password match
      if (password == confirmPassword) {
        /// Sign Up
        authCubit.register(name, email, password);
      }
      /// Password does not match
      else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Passwords does not match!')));
      }
    }
    /// fields are empty -> display error
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please complete all fields')));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Form(
      key: zohKey,
      child: Column(
        children: [
          /// Name
          TextFormField(
            controller: nameController,
            validator: (zoh) {
              if (zoh!.isEmpty) {
                return "${ZohTextString.name} is missing";
              }
              return null;
            },
            cursorColor: dark ? Colors.white : Colors.black,
            keyboardType: TextInputType.name,
            style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontFamily: 'Poppins'),
            decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(
                  Icons.person,
                  color: dark ? Colors.white : Colors.black,
                ),
                labelText: ZohTextString.name,
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

          /// Email
          TextFormField(
            controller: emailController,
            validator: (wariz) {
              if (wariz!.isEmpty) {
                return "${ZohTextString.email} is missing";
              }
              return null;
            },
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
              height: ZohSizes.defaultSpace
          ),

          /// Password
          TextFormField(
            controller: passwordController,
            validator: (olamide) {
              if (olamide!.isEmpty) {
                return "${ZohTextString.password} is missing";
              }
              return null;
            },
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
              height: ZohSizes.defaultSpace
          ),

          /// Confirm Password
          TextFormField(
            controller: confirmPasswordController,
            validator: (zoh) {
              if (zoh!.isEmpty) {
                return "${ZohTextString.confirmPassword} is missing";
              }
              return null;
            },
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
              suffixIcon: passwordZoh(),
              labelText: ZohTextString.confirmPassword,
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
            obscureText: _isSecuredZoh,
          ),

          const SizedBox(
            height: ZohSizes.defaultSpace,
          ),

          /// CheckBox
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue;
                  });
                },
                activeColor: Colors.blue,
                checkColor: Colors.white,
              ),
              const SizedBox(width: ZohSizes.xs),
              const Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${ZohTextString.iAgreeTo} ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '${ZohTextString.termsOfUse} ',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue)),
                      TextSpan(
                          text: '${ZohTextString.read} ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: ZohTextString.privacyPolicy,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: ZohSizes.defaultSpace,
          ),

          /// Create Account
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                textStyle: const TextStyle(fontSize: 28),
                minimumSize: const Size(0, 60),
              ),
              child: const Text(
                'Create account',
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
              : Colors.black),
    );
  }

  Widget passwordZoh() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecuredZoh = !_isSecuredZoh;
        });
      },
      icon: _isSecuredZoh
          ? Icon(Icons.visibility_off,
          color: ZohHelperFunctions.isDarkMode(context)
              ? Colors.white
              : Colors.black)
          : Icon(Icons.visibility,
          color: ZohHelperFunctions.isDarkMode(context)
              ? Colors.white
              : Colors.black),
    );
  }
}
