import 'package:flutter/material.dart';
import 'package:budget/ui/expenses/expenses_form_vm.dart';
import 'package:budget/models/expenseCategory.dart';

class ExpensesForm extends StatelessWidget {
  ExpensesForm({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final ExpensesFormViewModel viewModel;

  List<DropdownMenuItem<int>> _dropDownItems() {
    List<DropdownMenuItem<int>> items = [];
    ExpenseCategories.forEach((k, v) {
      items.add(
        DropdownMenuItem(
          child: Text(v),
          value: k,
        ),
      );
    });

    return items.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: viewModel.state.expenseForm,
              child: Column(
                children: <Widget>[
                  DropdownButtonFormField(
                    value: viewModel.state.expense.category,
                    decoration: InputDecoration(
                      labelText: "Category",
                    ),
                    items: _dropDownItems(),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Amount",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Amount is required';
                      }
                      final n = int.tryParse(value);
                      if (n == null) {
                        return '"$value" is not a valid number';
                      }
                      if (n <= 0) {
                        return 'amount must be positive';
                      }
                      return null;
                    },
                    onSaved: (val) {
//                      int n = int.tryParse(val);
//                      if (n == null) {
//                        viewModel.onFormSubmit(amount: 0);
//                      }
//                      viewModel.onFormSubmit(amount: n);
                    },
                    autocorrect: false,
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      elevation: 0,
                      onPressed: viewModel.onSubmitPressed,
                      child: Text("Submit"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
