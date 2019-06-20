import 'package:redux/redux.dart';
import 'package:budget/main.dart';
import 'package:budget/redux/app/app_state.dart';
import 'package:budget/redux/navigation/navigation_actions.dart';

List<Middleware<AppState>> createNavigationMiddleware() {
  return [
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigatePush),
    TypedMiddleware<AppState, NavigatePopAction>(_navigatePop),
  ];
}

_navigateReplace(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigateReplaceAction).routeName;
  if (store.state.route.isEmpty || store.state.route.last != routeName) {

    navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  next(action);
}

_navigatePush(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigatePushAction).routeName;
  if (store.state.route.isEmpty || store.state.route.last != routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }
  next(action);
}

_navigatePop(Store<AppState> store, action, NextDispatcher next) {
  if (navigatorKey.currentState.canPop()) {
    navigatorKey.currentState.pop();
  }
  next(action);
}