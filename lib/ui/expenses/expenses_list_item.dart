import 'package:flutter/material.dart';

class ExpenseListItem extends StatelessWidget {
  ExpenseListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Item',
            ),
          ),
        ),
        SizedBox(width: 32),
        Flexible(
          flex: 1,
          child: TextField(
            keyboardType: TextInputType.number,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.clear,
            size: 20,
          ),
          onPressed: () => {},
        )
      ],
    );
  }
}
