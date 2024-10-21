part of 'show_notes_bloc.dart';

@immutable
sealed class ShowNotesEvent {}

class NotesInitialEvent extends ShowNotesEvent {
  final String title;
  final String description;

  NotesInitialEvent(this.title, this.description);
}

class NotesUpdateEvent extends ShowNotesEvent {
  final String title;
  final String description;
  final String id;

  NotesUpdateEvent(this.title, this.description,this.id);
}