import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/local/AppLocal.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import 'Home.dart';

class LastStep extends StatefulWidget {
  @override
  _LastStepState createState() => _LastStepState();
}

class _LastStepState extends State<LastStep> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Container(
          color: AlmasaoodColors.primaryColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Image.asset(
                    "assets/images/smile.png",
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(64.0),
                child: Text(
                  AppLocalizations.of(context).trans('Your_order_will_be_ready'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: AlmasaoodColors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 64),
                child: MainButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                  text:  AppLocalizations.of(context).trans('back_to_home'),
                  textColor: AlmasaoodColors.white,
                  color: AlmasaoodColors.primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
  }
}
