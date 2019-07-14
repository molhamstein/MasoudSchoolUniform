import 'package:almasaood_app/Widgets/AuthTextField.dart';
import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import 'VerificationCode.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController mobileNumberController = new TextEditingController();

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
//          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 180,
                  width: 180,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
                child: Text("You are new here ?",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
              ),


              Padding(
                  padding:
                      const EdgeInsets.only(top: 70.0, left: 16, right: 16),
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
                        textEditingController: mobileNumberController,
                        hint: "Your full name",
                      ))),
              Padding(
                padding: const EdgeInsets.only(top: 64.0, bottom: 32),
                child: MainButton(color: AlmasaoodColors.darkBlue,textColor: AlmasaoodColors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VerificationCode()),
                    );

                  },
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
