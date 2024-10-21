import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_demo/model/auth_service.dart';
import 'package:firebase_demo/model/notes_model.dart';
import 'package:meta/meta.dart';

part 'show_notes_event.dart';
part 'show_notes_state.dart';

class ShowNotesBloc extends Bloc<ShowNotesEvent, ShowNotesState> {
  ShowNotesBloc() : super(ShowNotesInitial(notes: [])) {
    on<NotesInitialEvent>(notesInitialEvent);
    on<NotesUpdateEvent>(notesUpdateEvent);
  }
  final AuthService authService = AuthService();
  FutureOr<void> notesInitialEvent(NotesInitialEvent event, Emitter<ShowNotesState> emit) async{
    authService.addNotes(event.title, event.description);
    // state.notes = await authService.getNotesData();
    emit(NotesLoadingSuccessState(notes: state.notes));
  }

  FutureOr<void> notesUpdateEvent(NotesUpdateEvent event, Emitter<ShowNotesState> emit) async{
    authService.updateNotes(event.title, event.description, event.id);
    // state.notes = await authService.getNotesData();
    emit(NotesLoadingSuccessState(notes: state.notes));
  }
}
