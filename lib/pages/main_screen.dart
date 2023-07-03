import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signteach/pages/letter_screen.dart';
import 'package:signteach/pages/login_screen.dart';
import 'package:signteach/utils/consts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentStartIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Bienvenido a Sign Teach",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Teach',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onPressed: () {
            _signOut(context);
          },
        ),
        backgroundColor: terciary,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: vowelsGreatingsAndColors.length,
            itemBuilder: (context, index) {
              if (index >= _currentStartIndex + 10) {
                _currentStartIndex += 10;
              }
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      changeScreen(context, vowelsGreatingsAndColors[index]);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(primary),
                      iconColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    child: Text(
                      vowelsGreatingsAndColors[index].replaceAll('%20', ' '),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            }),
      ),
      backgroundColor: secondary,
    );
  }

  void changeScreen(BuildContext context, String letter) {
    /* FirebaseStorage.instance
        .ref()
        .child('Buenas Noches.mp4')
        .getDownloadURL()
        .then((value) => videoUrl = value)
        .catchError((e) => Fluttertoast.showToast(msg: "a")) */
    ;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LetterScreen(
                  videoUrl:
                      'https://firebasestorage.googleapis.com/v0/b/signteach-be0de.appspot.com/o/$letter.mp4?alt=media',
                  title: letter,
                )));
  }

  void _signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
