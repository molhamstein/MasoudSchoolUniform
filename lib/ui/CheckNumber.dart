import 'package:almasaood_app/Widgets/AuthTextField.dart';
import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';

class CheckNumber extends StatefulWidget {
  @override
  _CheckNumberState createState() => _CheckNumberState();
}

class _CheckNumberState extends State<CheckNumber> {
  TextEditingController userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: AlmasaoodColors.darkBlue,
            image: DecorationImage(
                image: ExactAssetImage(
                  "assets/images/bg_MeasureTape.png",
                ),
                alignment: FractionalOffset.topRight),
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Image.asset(
                  "assets/images/logo_white.png",
                  height: 180,
                  width: 180,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, left: 16, right: 16),
                  child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 25.0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: AuthTextField(
                        textEditingController: userNameController,
                        hint: "Mobile Number",
                      ))),
              Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: MainButton(
                  onPressed: () {},
                    text: "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
