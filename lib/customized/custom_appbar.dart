import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  AnimationController animationController;
  Animation yogatween, drawertween, colorstween, hometween, icontween;
  Function()? onpressed;
  Customappbar({
    required this.animationController,
    required this.yogatween,
    required this.drawertween,
    required this.colorstween,
    required this.hometween,
    required this.icontween,
    required Null Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => AppBar(
                leading: IconButton(
                    icon: Icon(Icons.dehaze),
                    color: drawertween.value,
                    onPressed: onpressed),
                backgroundColor: colorstween.value,
                elevation: 0,
                title: Row(
                  children: [
                    Text(
                      "HOME",
                      style: TextStyle(
                          color: hometween.value,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(width: 8),
                    Text("YOGA",
                        style: TextStyle(
                            color: yogatween.value,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))
                  ],
                ),
                actions: [
                  Icon(
                    Icons.notifications,
                    color: icontween.value,
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(backgroundColor: Colors.black)
                ],
              )),
    );
  }
}
