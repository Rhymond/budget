import 'package:budget/redux/app/app_state.dart';
import 'package:budget/redux/income/income_reducer.dart';
import 'package:budget/redux/expenses/expenses_reducer.dart';
import 'package:budget/redux/navigation/navigation_reducer.dart';

AppState appReducer(AppState state, dynamic action) => new AppState(
      incomeState: incomeReducer(state.incomeState, action),
      expensesState: expensesReducer(state.expensesState, action),
      route: navigationReducer(state.route, action),
    );
