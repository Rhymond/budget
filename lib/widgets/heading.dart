import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  Heading(
    this.text, {
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
