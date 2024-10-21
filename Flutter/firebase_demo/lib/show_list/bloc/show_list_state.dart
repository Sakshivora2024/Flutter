part of 'show_list_bloc.dart';

@immutable
sealed class ShowListState {
  List<RegistrationModel> registrationModel;
  List<NotesModel> notes;

  ShowListState({required this.registrationModel,required this.notes});
}

final class ShowListInitial extends ShowListState {
  ShowListInitial({required super.registrationModel, required super.notes});
}

class ShowListLoadedState extends ShowListState {
  ShowListLoadedState({required super.registrationModel, required super.notes});
}

class ShowListLoadingSuccessState extends ShowListState {
  ShowListLoadingSuccessState({required super.registrationModel, required super.notes});
}

class ShowListErrorState extends ShowListState {
  ShowListErrorState({required super.registrationModel, required super.notes});
}