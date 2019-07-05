import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';

class MainButton extends StatefulWidget {
  final Function onPressed;

  final String text;

  final double height;
  final double width;
  final color;

  final textColor;

  MainButton(
      {@required this.onPressed,
      this.text,
      this.height = 50,
      this.width = 250,
      this.color = AlmasaoodColors.white,
      this.textColor = AlmasaoodColors.black});

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  // TODO: implement widget
  MainButton get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black45,
              blurRadius: 25.0,
              offset: Offset(0, 7),
            ),
          ],
        ),
        height: widget.height,
        width: widget.width,
        child: RaisedButton(
          color: widget.color,
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: widget.textColor),
          ),
        ));
  }
}
