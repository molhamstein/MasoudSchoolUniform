import 'package:almasaood_app/Widgets/AuthTextField.dart';
import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/ui/signUp.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import '../ApiProvider.dart';

class CheckNumber extends StatefulWidget {
  @override
  _CheckNumberState createState() => _CheckNumberState();
}

class _CheckNumberState extends State<CheckNumber> with SingleTickerProviderStateMixin {
  TextEditingController userNameController = new TextEditingController();

  AnimationController animationController;
  Animation logoAnimation ;
  Animation textFieldAnimation ;
  Animation buttonAnimation ;


  @override
  void initState() {
    animationController = new AnimationController(vsync: this , duration: Duration(seconds: 4));
    logoAnimation = Tween(begin: -1.0 , end: 0.0).animate(CurvedAnimation(parent: animationController, curve:  ElasticOutCurve(0.5)));
    textFieldAnimation = Tween(begin: 1.0 , end: 0.0).animate(CurvedAnimation(parent: animationController, curve: Interval(0.5, 1.0,curve:  ElasticOutCurve(0.5))));
    buttonAnimation = Tween(begin: 1.0 , end: 0.0).animate(CurvedAnimation(parent: animationController, curve: Interval(0.9, 1.0,curve:  ElasticOutCurve(0.8))));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation:animationController ,builder: (context , child){
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
                Transform(
                  transform: Matrix4.translationValues(0.0, logoAnimation.value * MediaQuery.of(context).size.height, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 110),
                    child: Image.asset(
                      "assets/images/logo_white.png",
                      height: 180,
                      width: 180,
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(0.0, textFieldAnimation.value * MediaQuery.of(context).size.height, 0.0),

                  child: Padding(
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
                ),
                Transform(
                  transform: Matrix4.translationValues(0.0, buttonAnimation.value * MediaQuery.of(context).size.height, 0.0),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 64.0),
                    child: MainButton(
                      onPressed: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => SignUp()),
//                        );

                      apiProvider.getProfile();
                      },
                      text: "Submit",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },

    );
  }
}
