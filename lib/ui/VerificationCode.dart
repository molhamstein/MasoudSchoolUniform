import 'package:almasaood_app/Widgets/AuthTextField.dart';
import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';

class VerificationCode extends StatefulWidget {
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  TextEditingController verificationCodeController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: AlmasaoodColors.pink,
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
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset(
                  "assets/images/logo.png",
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
                        textEditingController: verificationCodeController,
                        hint: "Verification Code",
                      ))),
              Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: MainButton(
                  color: AlmasaoodColors.darkBlue,
                  textColor: AlmasaoodColors.white,
                  onPressed: () {},
                  text: "Submit",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Text(
                    "Didn't Recive the SMS ?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Text(
                    "Resend Code",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
