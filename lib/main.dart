import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:budget/redux/app/app_reducer.dart';
import 'package:budget/redux/app/app_state.dart';
import 'package:budget/ui/layout/main.dart';
import 'package:budget/widgets/route_aware_widget.dart';
import 'package:budget/redux/navigation/navigation_middleware.dart';
import 'package:budget/ui/expenses/expenses_form_vm.dart';
import 'package:budget/ui/test/test.dart';
import 'package:budget/routes.dart';
import 'package:budget/redux/expenses/expenses_middleware.dart';
import 'package:redux_logging/redux_logging.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() => runApp(App());

class App extends StatelessWidget {
  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: []
        ..addAll(createNavigationMiddleware())
        ..addAll(createExpensesMiddleware())
        ..add(LoggingMiddleware.printer()));

  final theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textSelectionHandleColor: Colors.black,
    textSelectionColor: Colors.black12,
    cursorColor: Colors.black,
    toggleableActiveColor: Colors.black,
    buttonTheme: ButtonThemeData(
      height: 60,
      buttonColor: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      labelStyle: const TextStyle(
        color: Colors.black,
      ),
    ),
  );

  MaterialPageRoute _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MainRoute(Layout(), settings: settings);
      case AppRoutes.addExpense:
        return MainRoute(ExpenseFormScreen(), settings: settings);
      case AppRoutes.test:
        return MainRoute(Test(), settings: settings);
      default:
        return MainRoute(Layout(title: 'Budget app'), settings: settings);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorObservers: [routeObserver],
        navigatorKey: navigatorKey,
        title: 'Budget app',
        theme: theme,
        onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
      ),
    );
  }
}

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings})
      : super(
            builder: (_) => RouteAwareWidget(child: widget),
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child);
  }
}
