import 'package:flutter/material.dart';
import 'package:signteach/pages/video_screen.dart';
import 'package:signteach/utils/consts.dart';
import 'package:signteach/utils/functions.dart';

class CategoryScreen extends StatefulWidget {
  final List<String>? options;
  final String? name;
  const CategoryScreen({super.key, this.options, this.name});

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  int _currentStartIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          parseString(widget.name),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: terciary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
        child: ListView.builder(
            itemCount: widget.options?.length,
            itemBuilder: (context, index) {
              if (index >= _currentStartIndex + 10) {
                _currentStartIndex += 10;
              }
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _changeScreen(
                          context, parseString(widget.options?[index]));
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(primary),
                      iconColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    child: Text(
                      parseString(widget.options?[index])
                          .replaceAll('%20', ' '),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            }),
      )),
      backgroundColor: secondary,
    );
  }

  void _changeScreen(BuildContext context, String letter) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VideoScreen(
                  videoUrl:
                      'https://firebasestorage.googleapis.com/v0/b/signteach-be0de.appspot.com/o/$letter.mp4?alt=media',
                  title: letter,
                )));
  }
}
