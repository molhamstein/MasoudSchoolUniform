import 'dart:async';

import 'package:almasaood_app/ui/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../DataStore.dart';
import 'CheckNumber.dart';
import 'Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () => _NavigateTo());
  }

  _NavigateTo() {
    if (dataStore.user.token == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CheckNumber()),
      );
    } else if (dataStore.user.token != null &&
        dataStore.user.user.firstName == "") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 50,),
                Image.asset("assets/images/logo.png", height: MediaQuery.of(context).size.height/6, width: 150),
              ],
            ),
            Center(
                child: Image.asset(
              "assets/images/splashArt.png",
              width: MediaQuery.of(context).size.width - 150,height: MediaQuery.of(context).size.height/2.5
            )),
            Container(width: MediaQuery.of(context).size.width-16,
              child: Image.asset(
                "assets/images/splash_footer.png",
                width: MediaQuery.of(context).size.width,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
