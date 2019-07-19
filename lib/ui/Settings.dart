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
        backgroundColor: AlmasaoodColors.primaryColor,
        iconTheme: IconThemeData(color: AlmasaoodColors.textDark),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AlmasaoodColors.textLight,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: AlmasaoodColors.pink,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 150,
                      width: 150,
                    ),
                  )),
              Container(
                color: AlmasaoodColors.textLight,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 64),
                      child: Text("Some Slogan about the service"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, right: 32, bottom: 16),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Contact us"),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                          Divider()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, right: 32),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Terms of service"),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                          Divider()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64.0, bottom: 32),
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
