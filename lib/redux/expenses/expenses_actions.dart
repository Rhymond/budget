class SubmitExpenseForm {
  SubmitExpenseForm({
    this.category,
    this.amount,
  });

  final int category;
  final int amount;
}

class ExpenseFormChanged {
  ExpenseFormChanged({
    this.category,
    this.amount,
  });

  final int category;
  final int amount;
}

class SaveForm {
  SaveForm();
}

class ResetForm {
  ResetForm();
}
