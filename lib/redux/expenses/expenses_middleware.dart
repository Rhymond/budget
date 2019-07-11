import 'package:redux/redux.dart';
import 'package:budget/redux/app/app_state.dart';
import 'package:budget/redux/expenses/expenses_actions.dart';
import 'package:budget/redux/navigation/navigation_actions.dart';

List<Middleware<AppState>> createExpensesMiddleware() {
  final submitExpenseForm = _submitExpenseForm();

  return [
    TypedMiddleware<AppState, SubmitExpenseForm>(submitExpenseForm),
  ];
}

Middleware<AppState> _submitExpenseForm() {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    store.dispatch(SaveForm());
    store.dispatch(ResetForm());
    store.dispatch(NavigatePopAction());
    next(action);
  };
}
