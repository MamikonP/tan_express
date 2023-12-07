import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class HomeRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  HomeRoute({
    RouteSettings? settings,
    this.maintainState = true,
  }) : super(settings: settings, fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return const HomeScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
