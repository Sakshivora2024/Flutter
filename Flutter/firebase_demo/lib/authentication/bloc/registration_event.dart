part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

class RegistrationInitialEvent extends RegistrationEvent {}

class RegistrationPasswordEvent extends RegistrationEvent {}

class RegistrationImageEvent extends RegistrationEvent {
  final image;
  RegistrationImageEvent(this.image);
}

class RegistrationSignUpEvent extends RegistrationEvent {
  final String email;
  final String password;
  final String name;
  final String age;
  final File image;

  RegistrationSignUpEvent(this.email, this.password, this.name, this.age, this.image);
}

class RegistrationUpdateEvent extends RegistrationEvent {
  final String email;
  final String password;
  final String name;
  final String age;
  final String id;
  final File image;

  RegistrationUpdateEvent(this.email, this.password, this.name, this.age, this.image, this.id);
}

class SignInWithGoogleEvent extends RegistrationEvent {}