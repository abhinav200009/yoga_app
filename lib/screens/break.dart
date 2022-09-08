import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app/screens/finish.dart';
import 'package:yoga_app/screens/sphinx.dart';

class Break extends StatelessWidget {
  const Break({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerModels(context),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/breakk.jpg"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "Break",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40),
              ),
              const SizedBox(height: 2),
              Consumer<TimerModels>(builder: (context, mymodel, child) {
                return Text(
                  mymodel.countdown.toString(),
                  style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                );
              }),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("Skip", style: TextStyle(fontSize: 22))),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Sphinx()));
                      },
                      child: const Text("Previous",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Finish()));
                      },
                      child: const Text("Skip",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)))
                ],
              ),
              const Divider(thickness: 2),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Next: Bird Dog",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class TimerModels extends ChangeNotifier {
  TimerModels(context) {
    myTimersec(context);
  }
  int countdown = 20;
  myTimersec(context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Finish()));
      }
    });
  }
}
