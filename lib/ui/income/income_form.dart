import 'package:flutter/material.dart';
import 'package:budget/ui/income/income_form_vm.dart';
import 'package:budget/ui/income/income_period.dart';
import 'package:budget/ui/income/income_amount.dart';

class IncomeForm extends StatelessWidget {
  IncomeForm({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final IncomeFormViewModel viewModel;

  List<Widget> _amountFields(bool showTips) {
    List<Widget> fields = [];
    for (var i = 0; i < viewModel.period; i++) {
      fields.add(Amount(
        showTips: showTips,
        incomeValue: viewModel.incomeAmount[i],
        tipsValue: viewModel.tipsAmount[i],
        onTipsChange: (value) {
          viewModel.onTipsAmountChange(i, value);
        },
        onIncomeChange: (value) {
          viewModel.onIncomeAmountChange(i, value);
        },
      ));
    }
    return fields;
  }

  String _totalIncome() {
    int total = 0;
    total += viewModel.incomeAmount.reduce((t, v) => t += v);
    if (viewModel.showTips) {
      total += viewModel.tipsAmount.reduce((t, v) => t += v);
    }
    return (total / 100).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.from(<Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: Period(
                  onchange: viewModel.onPeriodSelected,
                  value: viewModel.period,
                ),
              ),
              SwitchListTile(
                value: viewModel.showTips,
                onChanged: viewModel.onShowTipsToggle,
                title: Text("Add tips"),
                isThreeLine: false,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: _amountFields(viewModel.showTips),
                ),
              ),
              SizedBox(height: 32.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Total"),
                    ),
                    Expanded(
                      child: Text(
                        _totalIncome(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class GroupModel {
  String text;
  int periods;

  GroupModel({this.text, this.periods});
}
