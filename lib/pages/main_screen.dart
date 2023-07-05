import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signteach/pages/category_screen.dart';
import 'package:signteach/pages/video_screen.dart';
import 'package:signteach/components/custom_drawer.dart';
import 'package:signteach/utils/consts.dart';
import 'package:signteach/utils/functions.dart';

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
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          'Sign Teach',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: terciary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                if (index >= _currentStartIndex + 10) {
                  _currentStartIndex += 10;
                }
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _changeScreen(context, categories[index].options,
                            categories[index].name);
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(primary),
                        iconColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      child: Text(
                        parseString(categories[index].name)
                            .replaceAll('%20', ' '),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
      backgroundColor: secondary,
    );
  }

  void _changeScreen(
      BuildContext context, List<String>? options, String? name) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryScreen(
                  options: options,
                  name: name,
                )));
  }
}
