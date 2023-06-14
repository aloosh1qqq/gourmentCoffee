import 'dart:convert';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gourmentcofe/models/user_modle.dart';
import 'package:gourmentcofe/screens/main_screen.dart';
import 'package:gourmentcofe/widgets/main_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var isPasswordHidden = true;

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
            // Positioned(
            //   bottom: -80,
            //   left: -120,
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     decoration: const BoxDecoration(
            //         color: Colors.red,
            //         shape: BoxShape.circle,
            //         boxShadow: [
            //           BoxShadow(
            //               color: Color.fromARGB(255, 14, 123, 213),
            //               blurRadius: 15.0,
            //               spreadRadius: 15.0,
            //               blurStyle: BlurStyle.outer)
            //         ]),
            //   ),
            // ),
            // Positioned(
            //   top: -20,
            //   right: -50,
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     decoration: const BoxDecoration(
            //         color: Colors.orange,
            //         shape: BoxShape.circle,
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.orange,
            //               blurRadius: 15.0,
            //               spreadRadius: 15.0,
            //               blurStyle: BlurStyle.outer)
            //         ]),
            //   ),
            // ),
            // BackdropFilter(
            //   filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white.withOpacity(0.2),
            //     ),
            //   ),
            // ),
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
                          child: MainButton(
                            onTap: () {
                              signIn(emailController.text.toString(),
                                  passwordController.text.toString());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Main_screen()));
                            },
                            title: "Login Now",
                          ),
                        ),

                        // Forgot Password
                        // Container(
                        //   margin: const EdgeInsets.all(5),
                        //   child: TextButton(
                        //       onPressed: () {
                        //         Navigator.pushNamed(context, '/forgot');
                        //       },
                        //       child: const Text("Forgot Password?")),
                        // ),

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
      await _auth
          .signInWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .then((uid) async {
        Fluttertoast.showToast(msg: "Login Successful!");
        final DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid.user?.uid)
            .get();

        UserModel u = UserModel.fromMap(snapshot.data());
        preferences.setString("uid", uid.user!.uid);
        preferences.setString('userName', u.email.toString());
        preferences.setString('userType', u.type.toString());
      }).catchError((e) {
        print(e!.message);
        Fluttertoast.showToast(msg: e!.message);
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
