import 'package:flutter/material.dart';

class Amount extends StatelessWidget {
  Amount({
    Key key,
    this.showTips,
    this.onTipsChange,
    this.onIncomeChange,
    this.tipsValue = 0,
    this.incomeValue = 0,
  }) : super(key: key);

  final bool showTips;
  final Function(int) onTipsChange;
  final Function(int) onIncomeChange;
  final int tipsValue;
  final int incomeValue;

  void _tipsUpdated(value) {
    int tips = int.tryParse(value) ?? 0;
    onTipsChange(tips);
  }

  void _incomeUpdated(value) {
    int income = int.tryParse(value) ?? 0;
    onIncomeChange(income);
  }

  List<Widget> _renderFields() {
    List<Widget> widgets = [];

    TextEditingController _tipsController =
        TextEditingController.fromValue(TextEditingValue(
      text: tipsValue.toString(),
      selection: TextSelection.collapsed(offset: tipsValue.toString().length),
    ));

    TextEditingController _incomeController =
        TextEditingController.fromValue(TextEditingValue(
      text: incomeValue.toString(),
      selection: TextSelection.collapsed(offset: incomeValue.toString().length),
    ));

    if (showTips) {
      widgets.add(Flexible(
        child: TextField(
          onChanged: _tipsUpdated,
          controller: _tipsController,
          keyboardType: TextInputType.number,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: 'Tips',
          ),
        ),
      ));

      widgets.add(SizedBox(width: 16));
    }

    widgets.add(Flexible(
      child: TextField(
        onChanged: _incomeUpdated,
        controller: _incomeController,
        autocorrect: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Amount',
        ),
      ),
    ));

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _renderFields(),
    );
  }
}
