import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:signteach/components/text_field.dart';
import 'package:signteach/pages/main_screen.dart';
import 'package:signteach/utils/consts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          controller: _scrollController,
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 450,
                      child: Image.asset('assets/images/logo_image.png'),
                    ),
                    customTextField(
                        const InputDecoration(
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.email),
                          iconColor: Colors.black,
                        ),
                        false,
                        emailController),
                    customTextField(
                        const InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.password),
                          iconColor: Colors.black,
                        ),
                        true,
                        passwordController),
                    SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            label: const Text('Iniciar Sesión',
                                style: TextStyle(color: Colors.white)),
                            icon: const Icon(Icons.login),
                            onPressed: () {
                              _signIn(context);
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(primary),
                              iconColor: MaterialStatePropertyAll(Colors.white),
                            ),
                          ),
                          ElevatedButton.icon(
                            label: const Text('Iniciar Sesión con Google',
                                style: TextStyle(color: Colors.white)),
                            icon: const Icon(Icons.login),
                            onPressed: () {
                              _signInGoogle(context);
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(primary),
                              iconColor: MaterialStatePropertyAll(Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      label: const Text('Registrarse',
                          style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.login),
                      onPressed: () {
                        //_signInGoogle(context);
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(primary),
                        iconColor: MaterialStatePropertyAll(Colors.white),
                      ),
                    ),
                  ],
                );
              })),
      backgroundColor: secondary,
    );
  }

  void _signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Usuario o contraseña incorrectos, reingrese!");
    }
  }

  Future<void> _signInGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainScreen()));
  }
}
