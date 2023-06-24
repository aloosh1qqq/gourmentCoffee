import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gourmentcofe/models/user_modle.dart';
import 'package:gourmentcofe/screens/main_screen.dart';

import 'package:progress_state_button/progress_button.dart';

import '../main.dart';
import '../test.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var isPasswordHidden = true;
  ButtonState stateTextWithIcon = ButtonState.idle;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        right: false,
        left: false,
        bottom: false,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: 0,
                bottom: -500,
                right: 0,
                left: 0,
                child: Container(
                    decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/back.jpg'),
                    fit: BoxFit.fill,
                  ),
                ))),
            SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Welcome Back Text
                        Container(
                          padding: const EdgeInsets.only(
                            top: 80,
                          ),
                          child: const Text(
                            "Welcome Back!",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),

                        // Username Input
                        Container(
                          margin: const EdgeInsets.only(
                              top: 50, left: 25, right: 25),
                          child: TextFormField(
                            autofocus: true,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("* required");
                              }
                              // reg expression for email validation
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please enter a valid email!");
                              }

                              return null;
                            },
                            decoration:
                                const InputDecoration(label: Text("Email")),
                          ),
                        ),

                        // Password Input
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, left: 25, right: 25),
                          child: TextFormField(
                            obscureText: isPasswordHidden,
                            autofocus: true,
                            controller: passwordController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return ("* required");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Minimum 6 characters!");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text("Password"),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  isPasswordHidden = !isPasswordHidden;
                                  setState(() {});
                                },
                                icon: const Icon(Icons.remove_red_eye),
                              ),
                            ),
                          ),
                        ),

                        // Login Now Button
                        Container(
                          width: 200,
                          height: 40,
                          margin: const EdgeInsets.only(top: 50),
                          child: MyCustomWidget(
                            icon: Icons.login,
                            ontap: () {
                              signIn(emailController.text.toString(),
                                  passwordController.text.toString());
                            },
                            text: "Login Now",
                            stateTextWithIcon: stateTextWithIcon,
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 250),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Dont have an account?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/signup');
                                  },
                                  child: const Text("Sign Up"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        stateTextWithIcon = ButtonState.loading;
      });
      await _auth
          .signInWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .then((uid) async {
        Future.delayed(Duration(seconds: 1), () {
          Fluttertoast.showToast(msg: "Login Successful!");
          setState(() {
            stateTextWithIcon = ButtonState.success;
          });
        });

        Future.delayed(
          Duration(seconds: 2),
          () {
            stateTextWithIcon = ButtonState.success;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Main_screen()));
          },
        );
        final DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid.user?.uid)
            .get();
        UserModel u = UserModel.fromMap(snapshot.data());
        preferences.setString("uid", uid.user!.uid);
        preferences.setString('userName', u.email.toString());
        preferences.setString('userType', u.type.toString());
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
        setState(() {
          stateTextWithIcon = ButtonState.fail;
          Future.delayed(
            Duration(seconds: 2),
            () {
              setState(
                () {
                  stateTextWithIcon = ButtonState.idle;
                },
              );
            },
          );
        });
      });
    }
  }

  Future<User?> _signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
      return null;
    }
  }
}
