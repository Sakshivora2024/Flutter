part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {
  RegistrationModel registrationModel;
  List<RegistrationModel> register;

  RegistrationState({required this.registrationModel,required this.register});
}

final class RegistrationInitial extends RegistrationState {
  RegistrationInitial({required super.registrationModel, required super.register});
}

class RegistrationLoadedState extends RegistrationState {
  RegistrationLoadedState({required super.registrationModel, required super.register});
}

class RegistrationLoadingSuccessState extends RegistrationState {
  RegistrationLoadingSuccessState({required super.registrationModel, required super.register});


}

class RegistrationErrorState extends RegistrationState {
  RegistrationErrorState({required super.registrationModel, required super.register});
}
