import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:budget/redux/app/app_state.dart';
import 'package:budget/ui/expenses/expenses_list.dart';
import 'package:budget/redux/navigation/navigation_actions.dart';
import 'package:budget/routes.dart';
import 'package:budget/models/expense.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ExpensesListViewModel>(
      converter: ExpensesListViewModel.fromStore,
      builder: (context, viewModel) {
        return ExpensesList(
          viewModel: viewModel,
          title: "test",
        );
      },
    );
  }
}

class ExpensesListViewModel {
  ExpensesListViewModel({
    @required this.onAddItemPressed,
    @required this.expenses,
  });

  final Function onAddItemPressed;

  final List<Expense> expenses;

  static ExpensesListViewModel fromStore(Store<AppState> store) {
    return ExpensesListViewModel(
      onAddItemPressed: () => store.dispatch(NavigatePushAction(AppRoutes.addExpense)),
      expenses: store.state.expensesState.expenses,
    );
  }
}
