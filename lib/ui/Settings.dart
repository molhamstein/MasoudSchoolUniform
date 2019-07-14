import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AlmasaoodColors.darkBlue,
        iconTheme: IconThemeData(color: AlmasaoodColors.textDark),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AlmasaoodColors.pink,
          image: DecorationImage(
              image: ExactAssetImage(
                "assets/images/bg_MeasureTape.png",
              ),
              alignment: FractionalOffset.topRight),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset("assets/images/logo.png"),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text("Some Slogan about the service"),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Contact us"),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                          Divider()
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Terms of service"),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                          Divider()
                        ],
                      ),
                      Text("Log out")
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
