import 'package:flutter/material.dart';

class _GroupModel {
  String text;
  int perMonth;

  _GroupModel({this.text, this.perMonth});
}

class Period extends StatelessWidget {
  Period({Key key, this.value, this.onchange}) : super(key: key);

  final int value;
  final Function onchange;
  final List<_GroupModel> _group = [
    _GroupModel(
      text: "Monthly",
      perMonth: 1,
    ),
    _GroupModel(
      text: "Bi-weekly",
      perMonth: 2,
    ),
    _GroupModel(
      text: "Weekly",
      perMonth: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: "Paycheck",
      ),
      items: _group
          .map((g) => DropdownMenuItem(
                child: Text(g.text),
                value: g.perMonth,
              ))
          .toList(),
      onChanged: onchange,
      value: value,
    );
  }
}
