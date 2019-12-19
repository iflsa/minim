import 'package:flutter/material.dart';
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:launcher_assist/launcher_assist.dart';

class AppsPage extends StatefulWidget {
  AppsPage({Key key}) : super(key: key);

  @override
  _AppsPageState createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {
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

    // Get wallpaper as binary data
    // LauncherAssist.getWallpaper().then((imageData) {
    //   setState(() {
    //     wallpaper = imageData;
    //   });
    // });
  }

  idk() async {}
  @override
  Widget build(BuildContext context) {
    if (installedApps == null)
      return Center(
        child: CircularProgressIndicator(),
        // TODO: Take it from Provider
      );
    else
      return Container(
        child: Center(
          child: SingleChildScrollView(
            child: Wrap(
              //direction: Axis.horizontal,
              children: <Widget>[
                for (var app in installedApps)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        LauncherAssist.launchApp(app["package"]);
                      },
                      child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: Container(
                            // color: snapshot.data ? Colors.green : Colors.red,
                            // child: Text("${app['package']}"))
                            // child: snapshot.data
                            child: Image.memory(app["icon"]),
                          )
                          // : Container(),

                          ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
  }
}
