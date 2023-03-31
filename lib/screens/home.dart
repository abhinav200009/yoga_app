// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yoga_app/customized/custom_drawer.dart';
import 'package:yoga_app/screens/startup.dart';
import '../customized/custom_appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _hometween, _drawertween, _icontween, _yogatween, _colortween;
  late AnimationController _textanimationcontroller;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colortween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_animationController);
    _icontween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_animationController);
    _drawertween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _yogatween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_animationController);
    _hometween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _textanimationcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    super.initState();
  }

  bool scrollListener(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels);
      _textanimationcontroller.animateTo(scrollNotification.metrics.pixels);
      bool scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Customdrawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: scrollListener,
        child: Stack(
          children: [
            Container(
                height: double.infinity,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                        child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(50, 120, 50, 60),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text("1",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  Text(
                                    "Streak",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text("179",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  Text("KCal",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white))
                                ],
                              ),
                              Column(
                                children: [
                                  Text("38",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  Text("Minutes",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white))
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Yoga For All",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Startup()));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 250,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage('assets/yoga.jpg'),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        height: 250,
                                        color: Colors.black26,
                                      ),
                                      Positioned(
                                        top: 5,
                                        left: 20,
                                        child: Text(
                                          "Yoga For Beginners",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        left: 22,
                                        top: 30,
                                        child: Text(
                                          "Last Time: 26 Jan",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/yoga2.jpg'),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Container(
                                      height: 250,
                                      color: Colors.black26,
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 20,
                                      child: Text(
                                        "All In One Yoga",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Positioned(
                                      left: 22,
                                      top: 30,
                                      child: Text(
                                        "Last Time: 19 Jan",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/yoga3.jpg'),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Container(
                                      height: 250,
                                      color: Colors.black26,
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 20,
                                      child: Text(
                                        "10 Minutes Yoga",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Positioned(
                                      left: 22,
                                      top: 30,
                                      child: Text(
                                        "Last Time: 2 Feb",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Yoga For Students",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/yoga.jpg'),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Container(
                                      height: 250,
                                      color: Colors.black26,
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 20,
                                      child: Text(
                                        "Yoga For Weight Loss",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Positioned(
                                      left: 22,
                                      top: 30,
                                      child: Text(
                                        "Last Time: 16 Jan",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/yoga2.jpg'),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Container(
                                      height: 250,
                                      color: Colors.black26,
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 20,
                                      child: Text(
                                        "Yoga To Increase Concentration",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Positioned(
                                      left: 22,
                                      top: 30,
                                      child: Text(
                                        "Last Time: 14 Feb",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/yoga3.jpg'),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Container(
                                      height: 250,
                                      color: Colors.black26,
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 20,
                                      child: Text(
                                        "Yoga For Shoulders and Eyes",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Positioned(
                                      left: 22,
                                      top: 30,
                                      child: Text(
                                        "Last Time: 18 Feb",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                    Customappbar(
                        animationController: _animationController,
                        yogatween: _yogatween,
                        drawertween: _drawertween,
                        colorstween: _colortween,
                        hometween: _hometween,
                        icontween: _icontween,
                        onPressed: () {
                          scaffoldKey.currentState?.openDrawer();
                        })
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
