import 'package:redux/redux.dart';
import 'package:budget/redux/income/income_state.dart';
import 'package:budget/redux/income/income_actions.dart';

final incomeReducer = combineReducers<IncomeState>([
  TypedReducer<IncomeState, SelectIncomePeriod>(_updateIncomePeriod),
  TypedReducer<IncomeState, ToggleIncomeShowTips>(_toggleIncomeIncludeTips),
  TypedReducer<IncomeState, UpdateIncomeAmount>(_updateIncomeAmount),
  TypedReducer<IncomeState, UpdateTipsAmount>(_updateTipsAmount),
]);

IncomeState _updateIncomePeriod(IncomeState state, dynamic action) {
  return state.copyWith(
    period: action.period,
    incomeAmount: List<int>.generate(action.period, (_) => 0),
    tipsAmount: List<int>.generate(action.period, (_) => 0),
  );
}

IncomeState _toggleIncomeIncludeTips(IncomeState state, dynamic action) {
  return state.copyWith(showTips: action.showTips);
}

IncomeState _updateIncomeAmount(IncomeState state, dynamic action) {
  List<int> incomeAmount = []..addAll(state.incomeAmount);
  incomeAmount[action.index] = action.value;

  return state.copyWith(incomeAmount: incomeAmount);
}

IncomeState _updateTipsAmount(IncomeState state, dynamic action) {
  List<int> tipsAmount = []..addAll(state.tipsAmount);
  tipsAmount[action.index] = action.value;

  return state.copyWith(tipsAmount: tipsAmount);
}
