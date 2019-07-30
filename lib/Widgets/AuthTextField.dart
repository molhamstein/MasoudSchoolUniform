import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function onChange;
  final String hint;
  final TextInputType type;
  final Widget image ;
  AuthTextField(
      {@required this.textEditingController,
      this.onChange,
      this.hint,
      this.type = TextInputType.number , this
      .image});

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  // TODO: implement widget
  AuthTextField get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChange,
      keyboardType: widget.type,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,focusColor: AlmasaoodColors.primaryColor,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: widget.image,
        ),
        filled: true,
        fillColor: AlmasaoodColors.white,
        hintText: widget.hint,
        hintStyle: TextStyle(
            color: AlmasaoodColors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AlmasaoodColors.pink,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
