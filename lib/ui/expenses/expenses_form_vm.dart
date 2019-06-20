import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:budget/redux/app/app_state.dart';
import 'package:budget/redux/expenses/expenses_state.dart';
import 'package:budget/ui/expenses/expenses_form.dart';

//import 'package:budget/redux/expenses/expenses_actions.dart';
import 'package:budget/redux/navigation/navigation_actions.dart';
import 'package:budget/routes.dart';

class ExpenseFormScreen extends StatelessWidget {
  const ExpenseFormScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ExpensesFormViewModel>(
      converter: ExpensesFormViewModel.fromStore,
      builder: (context, viewModel) {
        return ExpensesForm(
          viewModel: viewModel,
        );
      },
    );
  }
}

class ExpensesFormViewModel {
  ExpensesFormViewModel({
    @required this.onSubmitPressed,
    @required this.state,
  });

  final ExpensesState state;

  final Function onSubmitPressed;

  static ExpensesFormViewModel fromStore(Store<AppState> store) {
    final state = store.state;
    final expenseState = state.expensesState;

    return ExpensesFormViewModel(
      state: expenseState,
      onSubmitPressed: () => store.dispatch(NavigatePopAction()),
    );
  }
}
