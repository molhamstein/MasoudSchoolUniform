import 'dart:async';

import 'package:flutter/material.dart';

import 'CheckNumber.dart';
import 'Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Timer(Duration(seconds: 5),()=>Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckNumber()),
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset("assets/images/logo.png",height: 150,width: 150),
          Center(child: Image.asset("assets/images/splashArt.png",width:MediaQuery.of(context).size.width-150,)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/splash_footer.png", width: MediaQuery.of(context).size.width-50,),
            ],
          )
        ],
      ),
    );
  }

}
