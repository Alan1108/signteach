import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        title: const Text('Sign Teach'),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: abecedary.length,
              itemBuilder: (context, index) {
                if (index >= _currentStartIndex + 10) {
                  _currentStartIndex += 10;
                }
                return Column(
                  children: [
                    ElevatedButton(
                      child: Text(abecedary[index]),
                      onPressed: () {
                        changeScreen(context, abecedary[index]);
                      },
                    )
                  ],
                );
              })),
    );
  }

  void changeScreen(BuildContext context, String letter) {}
}
