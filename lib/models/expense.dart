class Expense {
  Expense({
    this.category,
    this.amount,
  });

  Expense copyWith({
    int category,
    int amount,
  }) {
    return Expense(
      category: category ?? this.category,
      amount: amount ?? this.amount,
    );
  }

  final int category;
  final int amount;
}
