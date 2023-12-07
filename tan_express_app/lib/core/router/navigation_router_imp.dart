import 'package:flutter/material.dart';

import 'navigation_router.dart';

class NavigationRouterImp implements NavigationRouter {
  const NavigationRouterImp(this._navigatorKey);

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  void pop() => _navigatorKey.currentState?.pop();

  @override
  void popUntil(String routeName) => _navigatorKey.currentState
      ?.popUntil((Route<dynamic> route) => route.settings.name == routeName);

  @override
  Future<T?>? push<T>(
    String routeName, {
    Object? arguments,
  }) =>
      _navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);

  @override
  Future<T?>? pushReplace<T>(
    String routeName, {
    Object? arguments,
  }) =>
      _navigatorKey.currentState
          ?.pushReplacementNamed(routeName, arguments: arguments);

  @override
  Future<T?>? pushAndRemove<T>(
    String routeName, {
    Object? arguments,
  }) =>
      _navigatorKey.currentState?.pushNamedAndRemoveUntil(
          routeName, (Route<dynamic> route) => false,
          arguments: arguments);
}
