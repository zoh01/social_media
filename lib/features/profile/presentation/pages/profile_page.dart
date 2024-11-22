import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/auth/domain/entities/app_user.dart';
import 'package:music_app/features/auth/presentation/bloc/auth_cubit.dart';

import '../../../../constants/sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  /// Auth Cubit
  late final authCubit = context.read<AuthCubit>();

  /// Current User
  late AppUSer? currentUser = authCubit.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          currentUser!.email,
          style:
              const TextStyle(fontFamily: 'Poppins', fontSize: ZohSizes.md),
        ),
      ),
    );
  }
}
