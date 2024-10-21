import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_demo/model/auth_service.dart';
import 'package:firebase_demo/model/registration_model.dart';
import 'package:firebase_demo/routes/routes.dart';
import 'package:firebase_demo/show_list/bloc/show_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowListData extends StatefulWidget {
  const ShowListData({super.key});

  @override
  State<ShowListData> createState() => _ShowListDataState();
}

class _ShowListDataState extends State<ShowListData> {
  final AuthService authService = AuthService();

  // @override
  // void initState() {
  //   WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
  //     (timeStamp) {
  //       context.read<ShowListBloc>().add(ShowListInitialEvent());
  //     },
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of User"),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView (
        child: StreamBuilder(
          stream: authService.ref.onValue,
          builder: (context, snapshot) {
            List<RegistrationModel> register = [];
            if (snapshot.hasData &&
                snapshot.data != null &&
                (snapshot.data!).snapshot.value != null) {
              final data = Map<dynamic, dynamic>.from(
                  (snapshot.data!).snapshot.value as Map<dynamic, dynamic>);
              data.forEach((key, value) {
                final registration = Map<dynamic, dynamic>.from(value);
                register.add(RegistrationModel(
                  password: registration["password"],
                    id: registration["id"],
                    image: registration["image"],
                    name: registration["name"],
                    age: registration["age"],
                    email: registration["email"]));
              });
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(top: 20.w, right: 20.w, left: 20.w),
                    child: Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: CachedNetworkImage(
                                  imageUrl: register[index].image ?? "",
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                register[index].name ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Email:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                register[index].email ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Age:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                register[index].age ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () async {
                                    await Navigator.pushNamed(
                                        context, Routes.register,
                                        arguments:
                                        register[index]);
                                  },
                                  child: Text("Edit")),
                              ElevatedButton(
                                  onPressed: () {
                                    authService.ref
                                        .child(register[index].id ?? "")
                                        .remove();
                                  },
                                  child: Text("Delete")),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: register.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              );
            } else {
              return Center(
                child: Text("Hiii........",style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w400)),
              );
            }
          },
        ),
      ),

      // SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       BlocBuilder<ShowListBloc, ShowListState>(
      //         builder: (context, state) {
      //           if (state is ShowListLoadedState) {
      //             return const Center(
      //               child: CircularProgressIndicator(),
      //             );
      //           } else if (state is ShowListLoadingSuccessState) {
      //             return ListView.builder(
      //               itemBuilder: (context, index) {
      //                 return Padding(
      //                   padding:
      //                       EdgeInsets.only(top: 20.w, right: 20.w, left: 20.w),
      //                   child: Container(
      //                     padding: EdgeInsets.all(20.w),
      //                     decoration: BoxDecoration(
      //                         color: Colors.tealAccent,
      //                         borderRadius: BorderRadius.circular(10)),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Align(
      //                           alignment: Alignment.center,
      //                           child: SizedBox(
      //                             width: 150,
      //                             height: 150,
      //                             child: ClipRRect(
      //                               borderRadius: BorderRadius.circular(80),
      //                               child: CachedNetworkImage(
      //                                 imageUrl: state
      //                                         .registrationModel[index].image ??
      //                                     "",
      //                                 placeholder: (context, url) =>
      //                                     const CircularProgressIndicator(),
      //                                 errorWidget: (context, url, error) =>
      //                                     const Icon(Icons.error),
      //                                 fit: BoxFit.cover,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 30.h,
      //                         ),
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               "Name:",
      //                               style: TextStyle(
      //                                   fontWeight: FontWeight.w600,
      //                                   fontSize: 15.sp),
      //                             ),
      //                             SizedBox(
      //                               height: 5.h,
      //                             ),
      //                             Text(
      //                               state.registrationModel[index].name ?? "",
      //                               style: TextStyle(
      //                                   fontWeight: FontWeight.w400,
      //                                   fontSize: 15.sp),
      //                             ),
      //                             SizedBox(
      //                               height: 10.h,
      //                             ),
      //                             Text(
      //                               "Email:",
      //                               style: TextStyle(
      //                                   fontWeight: FontWeight.w600,
      //                                   fontSize: 15.sp),
      //                             ),
      //                             SizedBox(
      //                               height: 5.h,
      //                             ),
      //                             Text(
      //                               state.registrationModel[index].email ?? "",
      //                               style: TextStyle(
      //                                   fontWeight: FontWeight.w400,
      //                                   fontSize: 15.sp),
      //                             ),
      //                             SizedBox(
      //                               height: 10.h,
      //                             ),
      //                             Text(
      //                               "Age:",
      //                               style: TextStyle(
      //                                   fontWeight: FontWeight.w600,
      //                                   fontSize: 15.sp),
      //                             ),
      //                             SizedBox(
      //                               height: 5.h,
      //                             ),
      //                             Text(
      //                               state.registrationModel[index].age ?? "",
      //                               style: TextStyle(
      //                                   fontWeight: FontWeight.w400,
      //                                   fontSize: 15.sp),
      //                             ),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: 10.h,
      //                         ),
      //                         Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             ElevatedButton(
      //                                 onPressed: () async {
      //                                   final data = await Navigator.pushNamed(
      //                                       context, Routes.register,
      //                                       arguments:
      //                                           state.registrationModel[index]);
      //                                   if (data == true) {
      //                                     if (context.mounted) {
      //                                       context
      //                                           .read<ShowListBloc>()
      //                                           .add(ShowListInitialEvent());
      //                                     }
      //                                   }
      //                                 },
      //                                 child: Text("Edit")),
      //                             // ElevatedButton(
      //                             //     onPressed: () {
      //                             //        context.read<ShowListBloc>().add(SignOutEvent());
      //                             //       Navigator.pushNamed(context, Routes.login);
      //                             //     }, child: Text("Logout")),
      //                           ],
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 );
      //               },
      //               itemCount: state.registrationModel.length,
      //               shrinkWrap: true,
      //               physics: const NeverScrollableScrollPhysics(),
      //             );
      //           } else if (state is ShowListErrorState) {
      //             return const Center(
      //               child: Text("Error........."),
      //             );
      //           } else {
      //             return const SizedBox();
      //           }
      //         },
      //       ),
      //       BlocBuilder<ShowListBloc, ShowListState>(
      //         builder: (context, state) {
      //           if (state is ShowListLoadedState) {
      //             return const Center(
      //               child: CircularProgressIndicator(),
      //             );
      //           } else if (state is ShowListLoadingSuccessState) {
      //             return ListView.builder(
      //               itemBuilder: (context, index) {
      //                 if (state.notes.isEmpty) {
      //                   return const SizedBox();
      //                 } else {
      //                   return Padding(
      //                     padding: EdgeInsets.only(
      //                         left: 20.w, right: 20.w, top: 20.w),
      //                     child: Container(
      //                       padding: EdgeInsets.all(20.w),
      //                       decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(30),
      //                           color: Colors.tealAccent),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Text(state.notes[index].title ?? ""),
      //                               SizedBox(
      //                                 height: 10.h,
      //                               ),
      //                               Text(state.notes[index].description ?? ""),
      //                             ],
      //                           ),
      //                           Column(
      //                             children: [
      //                               IconButton(
      //                                   onPressed: () async {
      //                                     final data =
      //                                         await Navigator.pushNamed(
      //                                             context, Routes.notes,
      //                                             arguments:
      //                                                 state.notes[index]);
      //                                     if (data == true) {
      //                                       if (context.mounted) {
      //                                         context
      //                                             .read<ShowListBloc>()
      //                                             .add(ShowListInitialEvent());
      //                                       }
      //                                     }
      //                                   },
      //                                   icon: Icon(Icons.edit)),
      //                               IconButton(
      //                                   onPressed: () {
      //                                     context.read<ShowListBloc>().add(
      //                                         ShowListDeleteEvent(
      //                                             state.notes[index].id ?? ""));
      //                                   },
      //                                   icon: Icon(Icons.delete))
      //                             ],
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   );
      //                 }
      //               },
      //               itemCount: state.notes.length,
      //               shrinkWrap: true,
      //               physics: const NeverScrollableScrollPhysics(),
      //             );
      //           } else if (state is ShowListErrorState) {
      //             return const Center(
      //               child: Text("Error........."),
      //             );
      //           } else {
      //             return const SizedBox();
      //           }
      //         },
      //       )
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data = await Navigator.pushNamed(context, Routes.notes);
          if (data == true) {
            if (context.mounted) {
              context.read<ShowListBloc>().add(ShowListInitialEvent());
            }
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
