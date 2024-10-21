import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_demo/model/auth_service.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);
    on<SignInWithGoogleEvent>(signInWithGoogleEvent);
  }
  final AuthService authService = AuthService();
  FutureOr<void> loginInitialEvent(LoginInitialEvent event, Emitter<LoginState> emit) async{
    final data = await authService.login(event.email,event.password);
  }

  FutureOr<void> signInWithGoogleEvent(SignInWithGoogleEvent event, Emitter<LoginState> emit) async{
   authService.signInWithGoogle();
    emit(LoginLoadingSuccessState());
  }
}
