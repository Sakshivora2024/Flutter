part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoadedState extends LoginState {}
class LoginLoadingSuccessState extends LoginState {}
class LoginErrorState extends LoginState {}