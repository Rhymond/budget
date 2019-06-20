import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:budget/redux/app/app_state.dart';
import 'package:budget/ui/expenses/expenses_list.dart';
import 'package:budget/redux/navigation/navigation_actions.dart';
import 'package:budget/routes.dart';

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
  });

  final Function() onAddItemPressed;

  static ExpensesListViewModel fromStore(Store<AppState> store) {
    return ExpensesListViewModel(
      onAddItemPressed: () => store.dispatch(NavigatePushAction(AppRoutes.addExpense))
    );
  }
}
