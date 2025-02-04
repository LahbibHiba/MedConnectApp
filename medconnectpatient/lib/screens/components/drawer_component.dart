 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medconnectpatient/screens/generate_qr_page.dart';

import '../incidents_page.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 116, 115, 115)),
            child: UserAccountsDrawerHeader(
              accountName: Text("Hiba Lahbib"),
              accountEmail: Text("hiba_lahbib@gmail.com"),
              decoration: BoxDecoration(color: Colors.grey),
              currentAccountPicture: CircleAvatar(
                //backgroundColor: Colors.pink,
                backgroundImage: AssetImage("assets/profile_image.jpg"),
              ),
              currentAccountPictureSize: Size.square(55),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.file_copy_rounded),
            title: const Text("My Incidents"),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: ((context) => const IncidentsPage()),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.qr_code),
            title: const Text("My QR Code"),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: ((context) => const GenerateQrPage()),
                ),
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text("Change Profile"),
          ),
          const ListTile(
            leading: Icon(Icons.download),
            title: Text("Downloads"),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
