import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_demo/model/auth_service.dart';
import 'package:firebase_demo/model/registration_model.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc()
      : super(RegistrationInitial(registrationModel: RegistrationModel(), register: [])) {
    on<RegistrationInitialEvent>(registrationInitialEvent);
    on<RegistrationSignUpEvent>(registrationSignUpEvent);
    on<RegistrationPasswordEvent>(registrationPasswordEvent);
    on<RegistrationImageEvent>(registrationImageEvent);
    on<RegistrationUpdateEvent>(registrationUpdateEvent);
    on<SignInWithGoogleEvent>(signInWithGoogleEvent);
  }

  final AuthService authService = AuthService();

  FutureOr<void> registrationInitialEvent(
      RegistrationInitialEvent event, Emitter<RegistrationState> emit) {
    emit(RegistrationLoadingSuccessState(
        registrationModel: state.registrationModel, register: state.register));
  }

  FutureOr<void> registrationPasswordEvent(
      RegistrationPasswordEvent event, Emitter<RegistrationState> emit) {
    state.registrationModel.obscureText = !state.registrationModel.obscureText;
    emit(RegistrationLoadingSuccessState(
        registrationModel: state.registrationModel, register: state.register));
  }

  FutureOr<void> registrationImageEvent(
      RegistrationImageEvent event, Emitter<RegistrationState> emit) async {
    state.registrationModel.imageFile = File(event.image.path);
    emit(RegistrationLoadingSuccessState(
        registrationModel: state.registrationModel, register: state.register));
  }

  FutureOr<void> registrationSignUpEvent(
      RegistrationSignUpEvent event, Emitter<RegistrationState> emit) async {
    final RegistrationModel? user = await authService.registration(
        email: event.email,
        password: event.password,
        name: event.name,
        age: event.age,
        image: event.image);
    // state.register = await authService.getData();
    if (user != null) {
      emit(RegistrationLoadingSuccessState(
          registrationModel: state.registrationModel, register: state.register));
    }
  }

  FutureOr<void> registrationUpdateEvent(RegistrationUpdateEvent event, Emitter<RegistrationState> emit) async{

    await authService.updateProfile(event.name, event.age, event.email, event.password, event.image);
    // state.register = await authService.getData(event.id);
    emit(RegistrationLoadingSuccessState(registrationModel: state.registrationModel, register: state.register));
  }

  FutureOr<void> signInWithGoogleEvent(SignInWithGoogleEvent event, Emitter<RegistrationState> emit) async{
    authService.googleSignIn;
  }
}
