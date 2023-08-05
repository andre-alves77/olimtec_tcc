import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCustomBottomNavigationBar extends StatefulWidget {
  @override
  _MyCustomBottomNavigationBarState createState() =>
      _MyCustomBottomNavigationBarState();
}

class _MyCustomBottomNavigationBarState
    extends State<MyCustomBottomNavigationBar> with TickerProviderStateMixin {
  int currentValue = 0;

  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _controller2;
  late Animation<double> _animation2;

  late AnimationController _controller3;
  late Animation<double> _animation3;

  late AnimationController _controller4;
  late Animation<double> _animation4;

  late AnimationController _controller5;
  late Animation<double> _animation5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation2 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller2,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation3 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller3,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller4 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation4 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller4,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller5 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation5 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller5,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();

    _controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: size.width * .14,
              width: size.width,
              margin: EdgeInsets.all(size.width * .04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: currentValue == 0 ? Colors.purple : Colors.black38,
                      size: _animation.value,
                    ),
                    onPressed: () {
                      setState(() {
                        currentValue = 0;
                        _controller.forward();
                        _controller2.reverse();

                        _controller3.reverse();
                        _controller4.reverse();
                        _controller5.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_rounded,
                      color: currentValue == 1 ? Colors.purple : Colors.black38,
                      size: _animation2.value,
                    ),
                    onPressed: () {
                      setState(() {
                        currentValue = 1;
                        _controller2.forward();
                        _controller.reverse();
                        _controller3.reverse();
                        _controller4.reverse();
                        _controller5.reverse();

                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_box_rounded,
                      color: currentValue == 2 ? Colors.purple : Colors.black38,
                      size: _animation3.value,
                    ),
                    onPressed: () {
                      setState(() {
                        currentValue = 2;
                        _controller3.forward();
                        _controller.reverse();
                        _controller2.reverse();
                        _controller4.reverse();
                        _controller5.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_rounded,
                      color: currentValue == 3 ? Colors.purple : Colors.black38,
                      size: _animation4.value,
                    ),
                    onPressed: () {
                      setState(() {
                        currentValue = 3;
                        _controller4.forward();
                        _controller.reverse();
                        _controller2.reverse();
                        _controller3.reverse();
                        _controller5.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings_rounded,
                      color: currentValue == 4 ? Colors.purple : Colors.black38,
                      size: _animation5.value,
                    ),
                    onPressed: () {
                      setState(() {
                        currentValue = 4;
                        _controller5.forward();
                        _controller.reverse();
                        _controller2.reverse();
                        _controller3.reverse();
                        _controller4.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
