part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends  AuthState {}

class LoginSucess extends  AuthState {
  final UserCredential credential;

  LoginSucess({required this.credential});
}

class LoginFailure extends  AuthState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

class SignUpLoading extends AuthState {}
class SignUpSucess extends AuthState {}
class SignUpFailure extends AuthState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}
