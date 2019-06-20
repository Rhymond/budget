import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:budget/redux/app/app_state.dart';
import 'package:budget/redux/income/income_actions.dart';
import 'package:budget/ui/income/income_form.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, IncomeFormViewModel>(
      converter: IncomeFormViewModel.fromStore,
      builder: (context, viewModel) {
        return IncomeForm(
          viewModel: viewModel,
        );
      },
    );
  }
}

class IncomeFormViewModel {
  IncomeFormViewModel({
    @required this.onPeriodSelected,
    @required this.period,
    @required this.showTips,
    @required this.onShowTipsToggle,
    @required this.onIncomeAmountChange,
    @required this.onTipsAmountChange,
    @required this.incomeAmount,
    @required this.tipsAmount,
  });

  final int period;
  final bool showTips;
  final List<int> incomeAmount;
  final List<int> tipsAmount;

  final Function(int) onPeriodSelected;
  final Function(bool) onShowTipsToggle;
  final Function(int, int) onIncomeAmountChange;
  final Function(int, int) onTipsAmountChange;

  static IncomeFormViewModel fromStore(Store<AppState> store) {
    final state = store.state;

    return IncomeFormViewModel(
      showTips: state.incomeState.showTips,
      period: state.incomeState.period,
      incomeAmount: state.incomeState.incomeAmount,
      tipsAmount: state.incomeState.tipsAmount,
      onShowTipsToggle: (value) =>
          store.dispatch(ToggleIncomeShowTips(showTips: value)),
      onPeriodSelected: (value) {
        if (value != state.incomeState.period) {
          store.dispatch(SelectIncomePeriod(period: value));
        }
      },
      onIncomeAmountChange: (index, value) =>
          store.dispatch(UpdateIncomeAmount(index: index, value: value)),
      onTipsAmountChange: (index, value) =>
          store.dispatch(UpdateTipsAmount(index: index, value: value)),
    );
  }
}
