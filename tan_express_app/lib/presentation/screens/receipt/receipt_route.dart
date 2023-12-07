import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'receipt_screen.dart';


class ReceiptRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  ReceiptRoute({
    RouteSettings? settings,
    this.maintainState = true,
  }) : super(settings: settings, fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return const ReceiptScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
