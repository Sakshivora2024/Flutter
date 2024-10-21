import 'package:firebase_demo/authentication/bloc/registration_bloc.dart';
import 'package:firebase_demo/authentication/create_account.dart';
import 'package:firebase_demo/login/bloc/login_bloc.dart';
import 'package:firebase_demo/login/view/login.dart';
import 'package:firebase_demo/showNotes/bloc/show_notes_bloc.dart';
import 'package:firebase_demo/showNotes/view/notes_screen.dart';
import 'package:firebase_demo/show_list/bloc/show_list_bloc.dart';
import 'package:firebase_demo/show_list/view/show_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    login: (context) => BlocProvider(create: (context) => LoginBloc(),child: const Login()),
    register: (context) => BlocProvider(
        create: (context) => RegistrationBloc(), child: const CreateAccount()),
    showList: (context) => BlocProvider(create: (context) => ShowListBloc(),child: const ShowListData()),
    notes: (context) => BlocProvider(create: (context) => ShowNotesBloc(),child: const NotesScreen(),)
  };

  static const login = '/login';
  static const register = '/register';
  static const showList = '/list';
  static const notes = '/notes';
}
