import 'package:meta/meta.dart';
import 'package:budget/redux/income/income_state.dart';
import 'package:budget/redux/expenses/expenses_state.dart';
import 'package:budget/routes.dart';

@immutable
class AppState {
  final IncomeState incomeState;
  final ExpensesState expensesState;
  final List<String> route;

  AppState({
    @required this.incomeState,
    @required this.expensesState,
    this.route = const [AppRoutes.home],
  });

  factory AppState.initial() {
    return AppState(
      incomeState: IncomeState.initial(),
      expensesState: ExpensesState.initial(),
    );
  }

  AppState copyWith({
    IncomeState incomeState,
    ExpensesState expensesState,
    List<String> route,
  }) {
    return AppState(
      incomeState: incomeState ?? this.incomeState,
      expensesState: expensesState ?? this.expensesState,
      route: route ?? this.route,
    );
  }
}
