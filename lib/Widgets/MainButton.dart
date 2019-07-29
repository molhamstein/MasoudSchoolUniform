import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';

class MainButton extends StatefulWidget {
  final Function onPressed;

  final String text;

  final double height;
  final double width;
  final color;

  final textColor;
  final dashColor;
  final bool shouldRotate;

  MainButton(
      {@required this.onPressed,
      @required this.text,
      this.height = 50,
      this.width = 250,
      this.color = AlmasaoodColors.white,
      this.textColor = AlmasaoodColors.black,
      this.dashColor = AlmasaoodColors.white,
      this.shouldRotate = false});

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  // TODO: implement widget
  MainButton get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: bloc.shouldRotateStream,
        builder: (context, snapshot) {
          if (snapshot.data == false) {
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
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
                  color: widget.color,
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: widget.onPressed,
                  child: DashedContainer(
                    dashColor: widget.dashColor,
                    blankLength: 10,
                    borderRadius: 5,
                    strokeWidth: 2,
                    dashedLength: 5,
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      height: widget.height - 10,
                      width: widget.width,
                      child: Center(
                          child: AutoSizeText(
                        widget.text,
                        minFontSize: 12,
                        maxFontSize: 18,
                        style: TextStyle(
                            color: widget.textColor,
                            fontWeight: FontWeight.w700),
                      )

//                        Text(
//                          widget.text,
//                          style: TextStyle(
//                              fontSize: 18,
//                              fontWeight: FontWeight.w700,
//                              color: widget.textColor),
//                        ),
                          ),
                    ),
                  ),
                ));
          } else {
            return CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(widget.color));
          }
        });
  }
}
