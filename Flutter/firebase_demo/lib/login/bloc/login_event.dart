part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {
  final String email;
  final String password;

  LoginInitialEvent(this.email, this.password);
}

class SignInWithGoogleEvent extends LoginEvent {}
