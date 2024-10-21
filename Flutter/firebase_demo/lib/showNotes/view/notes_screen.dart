import 'package:firebase_demo/model/notes_model.dart';
import 'package:firebase_demo/routes/routes.dart';
import 'package:firebase_demo/showNotes/bloc/show_notes_bloc.dart';
import 'package:firebase_demo/widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final _todoKey = GlobalKey<FormState>();
  NotesModel? notesModel;
  bool isUpdate = false;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) {
        updateNotes();
      },
    );
    super.initState();
  }

  updateNotes() {
    notesModel = ModalRoute.of(context)?.settings.arguments as NotesModel?;
    if (notesModel != null) {
      isUpdate = true;
      titleController.text = notesModel?.title ?? "";
      descriptionController.text = notesModel?.description ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ShowNotesBloc, ShowNotesState>(
          builder: (context, state) {
            return Form(
              key: _todoKey,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextForm(
                      controller: titleController,
                      validator: (value) {
                        if ((value ?? "").isEmpty) {
                          return "Enter Title";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextForm(
                      controller: descriptionController,
                      maxLines: 10,
                      validator: (value) {
                        if ((value ?? "").isEmpty) {
                          return "Enter Description";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: 150,
                            height: 48,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_todoKey.currentState?.validate() ??
                                      false) {
                                    if (isUpdate == false) {
                                      context.read<ShowNotesBloc>().add(
                                          NotesInitialEvent(
                                              titleController.text,
                                              descriptionController.text));
                                      Navigator.pop(context,true);
                                    } else {
                                      context.read<ShowNotesBloc>().add(
                                          NotesUpdateEvent(
                                              titleController.text,
                                              descriptionController.text,notesModel?.id ?? ""));
                                      Navigator.pop(context,true);
                                    }
                                  }
                                },
                                child: Text(
                                    isUpdate == false ? "Add" : "Update"))))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
