import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/constants/sizes.dart';
import 'package:music_app/features/auth/presentation/bloc/auth_cubit.dart';

import '../componets/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home',
          style:
              TextStyle(fontFamily: 'Roboto', fontSize: ZohSizes.defaultSpace),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

