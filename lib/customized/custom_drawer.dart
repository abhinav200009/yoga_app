import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Customdrawer extends StatelessWidget {
  const Customdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/yoga1.jpg'),
            minRadius: 50,
            maxRadius: 70,
          ),
          const ListTile(
              title: Text("Restart Progress", style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.restart_alt_sharp)),
          const ListTile(
              title: Text("Share With Friends", style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.share)),
          const ListTile(
              title: Text("Rate Us", style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.star)),
          const ListTile(
              title: Text("Feedback", style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.feedback)),
          const ListTile(
              title: Text("Privacy Policy", style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.security)),
          Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          const Text('Version 1.0.0'),
          ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text("SignOut"))
        ],
      ),
    );
  }
}
