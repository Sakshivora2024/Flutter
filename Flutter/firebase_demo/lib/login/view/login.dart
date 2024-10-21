import 'package:firebase_demo/login/bloc/login_bloc.dart';
import 'package:firebase_demo/model/auth_service.dart';
import 'package:firebase_demo/routes/routes.dart';
import 'package:firebase_demo/widgets/text_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  RegExp email = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
  RegExp password =
  RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$");
  bool passwordVisible = true;

  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text("Login", style: TextStyle(fontSize: 25.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white),),
        centerTitle: true,
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _loginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextForm(
                    controller: _emailController,
                    hintText: 'Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter email';
                      } else if (!email.hasMatch(value)) {
                        return 'Enter email in valid format';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextForm(
                    controller: _passwordController,
                    obscureText: passwordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                    ),
                    hintText: '*********',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      } else if (!password.hasMatch(value)) {
                        return 'Enter Password in valid format';
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 24.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_loginKey.currentState?.validate() ?? false) {

                          context.read<LoginBloc>().add(LoginInitialEvent(_emailController.text, _passwordController.text));
                          Navigator.pushNamed(context, Routes.showList);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent),
                      child: Text(
                        "Sign in",
                        style:
                        TextStyle(fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                      color: Colors.teal),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Navigator.pushNamed(
                                            context, Routes.register))
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<LoginBloc>().add(SignInWithGoogleEvent());
                      Navigator.pushNamed(context, Routes.showList);
                      // context.read<LoginBloc>().dispatch(SignInWithGoogleEvent());
                    },
                    icon: FaIcon(FontAwesomeIcons.google),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        minimumSize: Size(327.w, 44.h)), label: Text("Sign In with Google"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
