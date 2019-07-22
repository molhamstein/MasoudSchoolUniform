import 'package:flutter/material.dart';
import 'AlmasaoodColors.dart';
import 'local/AppLocal.dart';

mixin UserFeedback {
  void showInSnackBar(String value, BuildContext context,
      {Color color = AlmasaoodColors.red}) {

    FocusScope.of(context).requestFocus(new FocusNode());
    Scaffold.of(context)?.removeCurrentSnackBar();
    Scaffold.of(context).reassemble();

    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: color,
      duration: Duration(seconds: 3),
    ));
  }
}
