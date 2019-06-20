import 'package:flutter/material.dart';
import 'package:budget/ui/expenses/expenses_list_vm.dart';

class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              ExpenseListScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
