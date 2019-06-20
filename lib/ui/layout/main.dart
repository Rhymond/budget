import 'package:flutter/material.dart';
import 'package:budget/ui/income/income_form_vm.dart';
import 'package:budget/ui/expenses/expenses_screen.dart';

class Layout extends StatefulWidget {
  Layout({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Budget"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: "Income"),
              Tab(icon: Icon(Icons.directions_transit), text: "Budget"),
              Tab(icon: Icon(Icons.directions_bike), text: "Expenses"),
            ],
          ),
        ),
        body: TabBarView(children: [
          IncomeScreen(),
          Icon(Icons.directions_car),
          ExpensesScreen(),
        ]),
      ),
    );
  }
}