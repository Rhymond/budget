class SelectIncomePeriod {
  SelectIncomePeriod({
    this.period,
  });

  final int period;
}

class ToggleIncomeShowTips {
  ToggleIncomeShowTips({
    this.showTips,
  });

  final bool showTips;
}

class UpdateIncomeAmount {
  UpdateIncomeAmount({
    this.index,
    this.value,
  });

  final int index;
  final int value;
}

class UpdateTipsAmount {
  UpdateTipsAmount({
    this.index,
    this.value,
  });

  final int index;
  final int value;
}
