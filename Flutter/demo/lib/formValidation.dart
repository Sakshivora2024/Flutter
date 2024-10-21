import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  bool passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  RegExp email = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
  RegExp password =
      RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$");

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(  
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const Text(
                        "Please sign in to continue",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "email",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter email";
                            } else if (!email.hasMatch(value)) {
                              return "Enter email in valid form";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                              icon: const Icon(Icons.lock),
                              hintText: "password",
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            } else if (!password.hasMatch(value)) {
                              return "Password should be 6 or more";
                            }
                            return null;
                          }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.blue),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          onPressed: () => setState(() {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Login Successfully")));
                            }
                          }),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                            text: const TextSpan(
                                text: "Don't have an Account? ",
                                style: TextStyle(color: Colors.black, fontSize: 18),
                                children: [
                                  TextSpan(
                                      text: "Sign Up",
                                      style: TextStyle(color: Colors.blueAccent, fontSize: 18))
                                ])),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
