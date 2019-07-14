import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';

class LastStep extends StatefulWidget {
  @override
  _LastStepState createState() => _LastStepState();
}

class _LastStepState extends State<LastStep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(color: AlmasaoodColors.darkBlue,
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top:60.0),
                child: Expanded(child: Row(children: <Widget>[Image.asset("assets/images/smile.png")],)),
              ),
              Text("Your Order will be readt in 24 hours"),
              Padding(
                padding: const EdgeInsets.only(top:16.0 ,bottom: 32),
                child: MainButton(
                  onPressed: () {},
                  text: "Back to home",
                  textColor: AlmasaoodColors.white,
                  color: AlmasaoodColors.darkBlue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
