import 'package:flutter/material.dart';
import 'package:budget/widgets/heading.dart';
import 'package:budget/ui/expenses/expenses_list_vm.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({
    Key key,
    @required this.title,
    @required this.viewModel,
  }) : super(key: key);

  final ExpensesListViewModel viewModel;
  final String title;
  final items = List<String>.generate(3, (i) => 'list_item_$i');

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Heading(title),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                elevation: 8.0,
                child: Container(
                  child: Text("Card"),
                ),
              );
            },
          ),
          RaisedButton(
            onPressed: viewModel.onAddItemPressed,
            child: Text("Add item"),
          )
        ]);
  }
}
