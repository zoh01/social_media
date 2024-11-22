import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/common/widgets/loaders.dart';
import 'package:music_app/features/auth/data/repository/firebase_auth_repo.dart';
import 'package:music_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:music_app/features/auth/presentation/pages/auth_page.dart';
import 'constants/theme/theme.dart';
import 'features/home/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: BlocConsumer<AuthCubit, AuthState>(
            builder: (context, authState) {
              print(authState);

              /// Unauthenticated
              if (authState is UnAuthenticated) {
                return const AuthPage();
              }

              /// Authenticated
              if (authState is Authenticated) {
                return const HomePage();
              }

              /// Loading
              else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },

            /// Listen for any errors
            listener: (context, state) {
              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
          )),
    );
  }
}
