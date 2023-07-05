import 'package:flutter/material.dart';
import 'package:signteach/components/custom_drawer.dart';
import 'package:signteach/utils/consts.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  GamesScreenState createState() => GamesScreenState();
}

class GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Juegos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: terciary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const CustomDrawer(),
      body: const Center(
          child: Column(
        children: [],
      )),
    );
  }
}
