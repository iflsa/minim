import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:minim/pages/AppsPage.dart';
import 'package:minim/pages/MainPage.dart';
import 'package:minim/pages/NewsPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _ctrl = PageController(initialPage: 1);
  var numberOfInstalledApps;
  var installedApps;
  var wallpaper;

  @override
  initState() {
    super.initState();

    // Get all apps
    LauncherAssist.getAllApps().then((apps) {
      setState(() {
        numberOfInstalledApps = apps.length;
        installedApps = apps;
      });
    });

    // // Get wallpaper as binary data
    // LauncherAssist.getWallpaper().then((imageData) {
    //   setState(() {
    //     wallpaper = imageData;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: PageView(
          controller: _ctrl,
          children: <Widget>[NewsPage(), MainPage(), AppsPage()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SingleChildScrollView(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (installedApps != null)
                  for (var app in installedApps)
                    SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: Image.memory(app["icon"])),
              ],
            ),
          ),
          shape: CircularNotchedRectangle(),
          color: Colors.blueGrey,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
