/*

Auth Repository Outlines the possible Auth operations for this app.

*/

import 'package:music_app/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUSer?> loginWithEmailPassword(String email, String password);

  Future<AppUSer?> registerWithEmailPassword(
      String email, String password, String name);

  Future<void> logOut();

  Future<AppUSer?> getCurrentUser();
}
