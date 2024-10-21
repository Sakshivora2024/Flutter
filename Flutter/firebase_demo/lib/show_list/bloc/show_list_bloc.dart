import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_demo/model/auth_service.dart';
import 'package:firebase_demo/model/notes_model.dart';
import 'package:firebase_demo/model/registration_model.dart';
import 'package:meta/meta.dart';

part 'show_list_event.dart';
part 'show_list_state.dart';

class ShowListBloc extends Bloc<ShowListEvent, ShowListState> {
  ShowListBloc() : super(ShowListInitial(registrationModel: [], notes: [])) {


    on<ShowListInitialEvent>(showListInitialEvent);
    on<ShowListDeleteEvent>(showListDeleteEvent);
    // on<SignOutEvent>(signOutEvent);
  }

  final AuthService authService = AuthService();
  
  FutureOr<void> showListInitialEvent(ShowListInitialEvent event, Emitter<ShowListState> emit) async{
    final data = await authService.currentUser();
    log('message$data');
    // await authService.ref.child(data ?? "").onValue.listen((entry){
    //   state.registrationModel.add(entry.snapshot.value as RegistrationModel);
    // });
    // state.registrationModel = await authService.getData(data);
    // state.notes = await authService.getNotesData();
    emit(ShowListLoadingSuccessState(registrationModel: state.registrationModel, notes: state.notes));
  }
  

  FutureOr<void> showListDeleteEvent(ShowListDeleteEvent event, Emitter<ShowListState> emit) async{
    await authService.deleteDate(event.id);
    // state.notes = await authService.getNotesData();
    emit(ShowListLoadingSuccessState(registrationModel: state.registrationModel, notes: state.notes));
  }

  // FutureOr<void> signOutEvent(SignOutEvent event, Emitter<ShowListState> emit) async{
  //   await authService.signOut();
  //   emit(ShowListLoadingSuccessState(registrationModel: state.registrationModel, notes: state.notes));
  // }
}
