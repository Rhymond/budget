import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:budget/redux/app/app_state.dart';
import 'package:budget/redux/expenses/expenses_actions.dart';
import 'package:budget/redux/navigation/navigation_actions.dart';
import 'package:budget/routes.dart';

List<Middleware<AppState>> createExpensesMiddleware() {
  final submitExpenseForm = _submitExpenseForm();

  return [
    TypedMiddleware<AppState, SubmitExpenseForm>(submitExpenseForm),
  ];
}

Middleware<AppState> _submitExpenseForm() {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    print("Hello");
//    StoreProvider.of<AppState>(context).dispatch(NavigatePopAction());
    next(action);
  };
}
