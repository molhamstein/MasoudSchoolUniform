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
      body: Container(color: AlmasaoodColors.darkBlue,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
        child: Column(mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset("assets/images/smile.png",height: 200,width: 200,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Your Order will be readt in 24 hours" ,style: TextStyle(fontSize: 13,color: AlmasaoodColors.white,fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 32),
              child: MainButton(
                onPressed: () {},
                text: "Back to home",
                textColor: AlmasaoodColors.white,
                color: AlmasaoodColors.darkBlue,width: 200,height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
