import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:budget/models/expense.dart';

@immutable
class ExpensesState {
  final List<Expense> expenses;
  final Expense expense;
  final GlobalKey<FormState> formKey;
  final TextEditingController amountController;

  ExpensesState({
    @required this.expenses,
    @required this.expense,
    this.formKey,
    this.amountController,
  });

  factory ExpensesState.initial() {
    return new ExpensesState(
      expenses: [Expense(category: 0, amount: 0)],
      expense: Expense(category: 0, amount: 0),
      formKey: GlobalKey<FormState>(),
      amountController: TextEditingController(),
    );
  }

  ExpensesState copyWith({
    List<Expense> expenses,
    Expense expense,
  }) {
    return new ExpensesState(
      expenses: expenses ?? this.expenses,
      expense: expense ?? this.expense,
      formKey: this.formKey,
      amountController: this.amountController,
    );
  }
}
