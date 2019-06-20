import 'package:meta/meta.dart';

@immutable
class IncomeState {
  final int period;
  final bool showTips;
  final List<int> incomeAmount;
  final List<int> tipsAmount;

  IncomeState({
    @required this.period,
    @required this.showTips,
    @required this.incomeAmount,
    @required this.tipsAmount,
  });

  factory IncomeState.initial() {
    return new IncomeState(
      period: 1,
      showTips: false,
      incomeAmount: [0],
      tipsAmount: [0],
    );
  }

  IncomeState copyWith({
    int period,
    bool showTips,
    List<int> incomeAmount,
    List<int> tipsAmount,
  }) {
    return new IncomeState(
      period: period ?? this.period,
      showTips: showTips ?? this.showTips,
      incomeAmount: incomeAmount ?? this.incomeAmount,
      tipsAmount: tipsAmount ?? this.tipsAmount,
    );
  }
}
