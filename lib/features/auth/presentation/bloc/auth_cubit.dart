import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/auth/domain/entities/app_user.dart';
import 'package:music_app/features/auth/domain/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUSer? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  /// check if user is already authenticated
  void checkAuth() async {
    final AppUSer? user = await authRepo.getCurrentUser();

    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(UnAuthenticated());
    }
  }

  /// get current user
  AppUSer? get currentUser => _currentUser;

  /// login with email & password
  Future<void> login(String email, String password) async {
    try{
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailPassword(email, password);

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  /// register with email & password
  Future<void> register(String name, String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailPassword(email, password, name);

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  /// logout
  Future<void> logOut() async {
    authRepo.logOut();
    emit(UnAuthenticated());
  }
}
