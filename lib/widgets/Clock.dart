import 'dart:async';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  var _text = "";
  Timer _timer;
  _getText() {
    var h = DateTime.now().hour;
    var m = DateTime.now().minute;
    setState(() {
      _text = "$h:$m";
    });
  }

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getText());
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _text,
        style: TextStyle(
          fontSize: 100.0,
          shadows: [
            Shadow(blurRadius: 5.0, offset: Offset(2, 0), color: Colors.black),
            Shadow(blurRadius: 5.0, offset: Offset(-2, 0), color: Colors.black),
            Shadow(blurRadius: 5.0, offset: Offset(0, 2), color: Colors.black),
            Shadow(blurRadius: 5.0, offset: Offset(0, -2), color: Colors.black),
          ],
        ),
      ),
    );
  }
}
