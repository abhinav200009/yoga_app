import 'package:flutter/material.dart';

class Customdrawer extends StatelessWidget {
  const Customdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/yoga1.jpg'),
            minRadius: 50,
            maxRadius: 70,
          ),
          ListTile(
              title: Text("Restart Progress", style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.restart_alt_sharp)),
          ListTile(
              title: Text("Share With Friends", style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.share)),
          ListTile(
              title: Text("Rate Us", style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.star)),
          ListTile(
              title: Text("Feedback", style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.feedback)),
          ListTile(
              title: Text("Privacy Policy", style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.security)),
          Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Text('Version 1.0.0')
        ],
      ),
    );
  }
}
