import 'package:almasaood_app/Widgets/AuthTextField.dart';
import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/models/ProfileModel.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import 'Home.dart';

class SignUp extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController eMailController = new TextEditingController();

  AnimationController animationController;
  Animation logoAnimation;

  Animation areYouNewAnimation;
  Animation firstNameAnimation;
  Animation lastNameAnimation;
  Animation eMailAnimation;

  Animation buttonAnimation;

  @override
  void initState() {
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 4));
    logoAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    areYouNewAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.9, 1.0, curve: ElasticOutCurve(0.5))));
    lastNameAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.7, 1.0, curve: ElasticOutCurve(0.5))));
    eMailAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: ElasticOutCurve(0.5))));
    firstNameAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3, 1.0, curve: ElasticOutCurve(0.5))));
    buttonAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 1.0, curve: ElasticOutCurve(0.5))));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProfileModel>(
        stream: bloc.signUpStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (context) => Home()));
            });
          }

          return AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Scaffold(
                body: Container(
                  color: AlmasaoodColors.pink,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
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
                          Transform(
                            transform: Matrix4.translationValues(
                                0.0,
                                logoAnimation.value *
                                    MediaQuery.of(context).size.height,
                                0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 110),
                              child: Image.asset(
                                "assets/images/logo.png",
                                height: 180,
                                width: 180,
                              ),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                0.0,
                                areYouNewAnimation.value *
                                    MediaQuery.of(context).size.height,
                                0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 32.0, left: 16, right: 16),
                              child: Text(
                                "You are new here ?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: AlmasaoodColors.textDark),
                              ),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                0.0,
                                firstNameAnimation.value *
                                    MediaQuery.of(context).size.height,
                                0.0),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 50.0, left: 16, right: 16),
                                child: Container(
                                    decoration: new BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 25.0,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: AuthTextField(
                                      textEditingController:
                                          firstNameController,
                                      hint: "First name",
                                    ))),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                0.0,
                                lastNameAnimation.value *
                                    MediaQuery.of(context).size.height,
                                0.0),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, left: 16, right: 16),
                                child: Container(
                                    decoration: new BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 25.0,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: AuthTextField(
                                      textEditingController: lastNameController,
                                      hint: "Last name",
                                    ))),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                0.0,
                                eMailAnimation.value *
                                    MediaQuery.of(context).size.height,
                                0.0),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, left: 16, right: 16),
                                child: Container(
                                    decoration: new BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 25.0,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: AuthTextField(
                                      textEditingController: eMailController,
                                      hint: "E-mail",
                                    ))),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                0.0,
                                buttonAnimation.value *
                                    MediaQuery.of(context).size.height,
                                0.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 64.0, bottom: 32),
                              child: MainButton(
                                color: AlmasaoodColors.darkBlue,
                                textColor: AlmasaoodColors.white,
                                onPressed: () {
                                  bloc.f_signUp( "first", "last",
                                      "email@email.com");

//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => Home()),
//                            );
                                },
                                text: "Submit",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
