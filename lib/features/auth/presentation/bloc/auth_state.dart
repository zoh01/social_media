part of 'auth_cubit.dart';

abstract class AuthState {}

/// Initial
class AuthInitial extends AuthState {}

/// Loading
class AuthLoading extends AuthState {}

/// Authenticated
class Authenticated extends AuthState {
  final AppUSer user;
  Authenticated(this.user);
}

/// UnAuthenticated
class UnAuthenticated extends AuthState {
}

/// Errors
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
