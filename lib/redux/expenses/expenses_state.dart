import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:budget/models/expense.dart';

@immutable
class ExpensesState {
  final List<Expense> expenses;
  final Expense expense;
  final GlobalKey<FormState> expenseForm;


  ExpensesState({
    @required this.expenses,
    @required this.expense,
    this.expenseForm,
  });

  factory ExpensesState.initial() {
    return new ExpensesState(
      expenses: [],
      expense: Expense(0, 10),
      expenseForm: GlobalKey<FormState>(),
    );
  }

  ExpensesState copyWith({
    List<Expense> expenses,
    Expense expense,
    GlobalKey<FormState> expenseForm
  }) {
    return new ExpensesState(
      expenses: this.expenses ?? expenses,
      expense: this.expense ?? expense,
    );
  }
}
