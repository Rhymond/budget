import 'package:redux/redux.dart';
import 'package:budget/redux/expenses/expenses_state.dart';
import 'package:budget/redux/expenses/expenses_actions.dart';

final expensesReducer = combineReducers<ExpensesState>([
  TypedReducer<ExpensesState, ExpenseFormChanged>(_expenseFormChanged),
  TypedReducer<ExpensesState, SaveForm>(_saveForm),
  TypedReducer<ExpensesState, ResetForm>(_resetForm),
]);

ExpensesState _resetForm(ExpensesState state, dynamic action) {
  return state.copyWith(
    expense: state.expense.copyWith(
      category: 0,
      amount: 0,
    ),
  );
}

ExpensesState _saveForm(ExpensesState state, dynamic action) {
  return state.copyWith(
    expenses: List.from(state.expenses)..add(state.expense),
  );
}

ExpensesState _expenseFormChanged(ExpensesState state, dynamic action) {
  return state.copyWith(
    expense: state.expense.copyWith(
      category: action.category,
      amount: action.amount,
    ),
  );
}
