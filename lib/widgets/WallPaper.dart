import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:minim/model/MyUtils.dart';

class WallPaper extends StatelessWidget {
  const WallPaper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int w = MyUtils.w(context).toInt() + 1;
    int h = MyUtils.h(context).toInt() + 1;
    print(w);
    return SizedBox.expand(
      child: Image.network(
        "https://picsum.photos/$w/$h",
        fit: BoxFit.none,
      ),
    );
  }
}
