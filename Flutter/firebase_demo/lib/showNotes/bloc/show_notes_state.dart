part of 'show_notes_bloc.dart';

@immutable
sealed class ShowNotesState {
  List<NotesModel> notes;

  ShowNotesState({required this.notes});
}

final class ShowNotesInitial extends ShowNotesState {
  ShowNotesInitial({required super.notes});
}

class NotesLoadedState extends ShowNotesState {
  NotesLoadedState({required super.notes});
}

class NotesLoadingSuccessState extends ShowNotesState {
  NotesLoadingSuccessState({required super.notes});
}

class NotesErrorState extends ShowNotesState {
  NotesErrorState({required super.notes});
}