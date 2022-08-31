import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app/screens/sphinx.dart';

class Ready extends StatelessWidget {
  const Ready({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) => TimerModel(context),
      child: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 2 - 100),
                const Text(
                  'Are You Ready',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 45),
                Consumer<TimerModel>(builder: (context, mymodel, child) {
                  return Text(
                    mymodel.countdown.toString(),
                    style: TextStyle(fontSize: 20),
                  );
                }),
                const Spacer(),
                const Divider(
                    thickness: 2, color: Colors.black, indent: 4, endIndent: 4),
                const Align(
                    alignment: Alignment.bottomLeft,
                    widthFactor: 80,
                    child: SafeArea(
                      bottom: true,
                      child: Text(
                        "Next: Sphinx Pose",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerModel extends ChangeNotifier {
  TimerModel(context) {
    myTimer(context);
  }
  int countdown = 5;
  myTimer(context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Sphinx()));
      }
    });
  }
}
