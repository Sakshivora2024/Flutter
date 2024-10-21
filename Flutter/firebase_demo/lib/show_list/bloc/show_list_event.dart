part of 'show_list_bloc.dart';

@immutable
sealed class ShowListEvent {}

class ShowListInitialEvent extends ShowListEvent {}

class ShowListDeleteEvent extends ShowListEvent {
  final String id;

  ShowListDeleteEvent(this.id);
}

class SignOutEvent extends ShowListEvent {}