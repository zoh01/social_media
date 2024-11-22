import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/features/auth/presentation/pages/login/login_screen.dart';
import 'package:music_app/features/auth/presentation/pages/signup/signup_screen.dart';

/// This page determines whether to show the login or register page


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // Initially show login Page
  bool showLoginPage = true;

  // toggle between pages
  void togglePages() {
    setState(() {
      showLoginPage =!showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const LoginScreen();
    } else {
      return const SignupScreen();
    }
  }
}
