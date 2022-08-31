import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app/screens/break.dart';

class Sphinx extends StatelessWidget {
  const Sphinx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModels>(
        create: (context) => TimerModels(context),
        child: Scaffold(
            body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 320,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/sphinx_pose.jpg"),
                          fit: BoxFit.fill)),
                ),
                const Spacer(),
                const Text(
                  "Sphinx Pose",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white)),
                      const Text(" : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white)),
                      Consumer<TimerModels>(builder: (context, mymodel, child) {
                        return Text(mymodel.countdown.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white));
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                Consumer<TimerModels>(builder: (context, mymodel, child) {
                  return ElevatedButton(
                      onPressed: () {
                        mymodel.show();
                      },
                      child: const Text(
                        "Pause",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ));
                }),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text("Previous",
                            style: TextStyle(fontSize: 17))),
                    TextButton(
                        onPressed: () {},
                        child:
                            const Text("Skip", style: TextStyle(fontSize: 17)))
                  ],
                ),
                const Spacer(),
                const Divider(thickness: 2),
                const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Next: Bird Dog",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ))
              ],
            ),
            Consumer<TimerModels>(builder: (context, mymodel, child) {
              return Visibility(
                  visible: mymodel.visible,
                  child: Container(
                      color: Colors.blueAccent.withOpacity(0.9),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Pause",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 43)),
                          Text("Yoga Feels Better",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 35),
                          OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "RESTART",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white))),
                          SizedBox(height: 20),
                          OutlinedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 19),
                                child: Text(
                                  "QUIT",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white))),
                          SizedBox(height: 20),
                          OutlinedButton(
                              onPressed: () {
                                mymodel.hide();
                              },
                              child: Text(
                                "RESUME",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)))
                        ],
                      )));
            }),
          ],
        )));
  }
}

class TimerModels extends ChangeNotifier {
  TimerModels(context) {
    myTimersec(context);
  }

  int countdown = 30;
  bool visible = false;
  myTimersec(context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Break()));
      }
    });
  }

  void show() {
    visible = true;
    notifyListeners();
  }

  void hide() {
    visible = false;
    notifyListeners();
  }
}
