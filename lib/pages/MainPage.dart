import 'package:flutter/material.dart';
import 'package:minim/widgets/Clock.dart';
import 'package:minim/widgets/WallPaper.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          WallPaper(),
          Clock(),
        ],
      ),
    );
  }
}
