import 'package:flutter/material.dart';
import 'package:budget/ui/expenses/expenses_form_vm.dart';
import 'package:budget/models/expenseCategory.dart';

class ExpensesForm extends StatelessWidget {
  @override
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
              key: viewModel.formKey,
              child: Column(
                children: <Widget>[
                  DropdownButtonFormField(
                    value: viewModel.expense.category,
                    decoration: InputDecoration(
                      labelText: "Category",
                    ),
                    items: _dropDownItems(),
                    onChanged: (val) => viewModel.onFormChanged(category: val),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Amount",
                    ),
                    initialValue: viewModel.expense.amount.toString(),
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
                    autocorrect: false,
                    onSaved: (val) => viewModel.onFormChanged(amount: int.parse(val)),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      elevation: 0,
                      onPressed: () {
                        if (viewModel.formKey.currentState.validate()) {
                          viewModel.formKey.currentState.save();
                          viewModel.onFormSubmit();
                        }
                      },
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
