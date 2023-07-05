import 'package:firebase_core/firebase_core.dart';
import 'package:signteach/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signteach/firebase_options.dart';
import 'package:signteach/repositories/models/user.dart' as appUser;

void initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

String parseString(String? str) {
  if (str == null) {
    return '';
  } else {
    return str;
  }
}

bool isNull(String? str) {
  return str == null ? true : false;
}

void signOut(BuildContext context) {
  FirebaseAuth.instance.signOut();
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
}

appUser.User getUser() {
  return appUser.User(
      displayName: FirebaseAuth.instance.currentUser?.displayName,
      email: FirebaseAuth.instance.currentUser?.email,
      photoUrl: FirebaseAuth.instance.currentUser?.photoURL);
}
