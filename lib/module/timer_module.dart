import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  TimerProvider(context) {
    myTimersec(context);
  }
  late Timer _timer;

  int _seconds = 30;
  bool _startEnable = true;
  bool _pauseEnable = false;
  bool _resumeEnable = false;
  bool visible = false;

  int get seconds => _seconds;
  bool get startEnable => _startEnable;
  bool get pauseEnable => _pauseEnable;
  bool get resumeEnable => _resumeEnable;

  void startTimer() {
    _seconds = 30;
    _startEnable = false;
    _pauseEnable = true;
    _resumeEnable = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds <= 30) {
        _seconds--;
      } else if (_seconds == 00) {
        _seconds = 0;
      }

      notifyListeners();
    });
  }

  myTimersec(context) async {
    if (_startEnable == false) {
      _startEnable = true;
      _resumeEnable = true;
      _pauseEnable = false;
      _timer.cancel();
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Break()));
    }
    notifyListeners();
  }

  void stopTimer() {
    if (_startEnable == false) {
      _startEnable = true;
      _resumeEnable = true;
      _pauseEnable = false;
      _timer.cancel();
    }
    notifyListeners();
  }

  void continueTimer() {
    _startEnable = false;
    _pauseEnable = true;
    _resumeEnable = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds <= 30) {
        _seconds--;
      } else if (_seconds == 00) {
        _seconds = 0;
      }

      notifyListeners();
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
