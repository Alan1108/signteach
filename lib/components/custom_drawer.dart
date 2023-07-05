import 'package:flutter/material.dart';
import 'package:signteach/repositories/models/user.dart' as app_user;
import 'package:signteach/utils/consts.dart';
import 'package:signteach/pages/main_screen.dart';
import 'package:signteach/pages/games_screen.dart';
import 'package:signteach/utils/functions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    app_user.User user = getUser();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: quaternary),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: primary,
                  radius: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: isNull(user.photoUrl)
                        ? Text(
                            parseString(user.displayName),
                            style: const TextStyle(color: Colors.white),
                          )
                        : Image.network(parseString(user.photoUrl)),
                  )
                  /* Text(
                    parseString(user.displayName?[0]),
                    style: const TextStyle(color: Colors.white, fontSize: 70),
                  ) */
                  ,
                ),
                Text(
                  parseString(user.email),
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
            title: const Text('Aprendizaje'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen()));
            },
            leading: const Icon(Icons.menu_book_sharp),
            iconColor: Colors.black,
          ),
          ListTile(
            title: const Text('Juegos'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const GamesScreen()));
            },
            leading: const Icon(Icons.gamepad),
            iconColor: Colors.black,
          ),
          ListTile(
            title: const Text("Cerrar Sesion"),
            onTap: () => signOut(context),
            leading: const Icon(Icons.logout),
            iconColor: Colors.black,
          )
        ],
      ),
    );
  }
}
