import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/tider/tider_entity.dart';
import 'receipt_screen.dart';

class ReceiptRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  ReceiptRoute({
    RouteSettings? settings,
    this.maintainState = true,
  }) : super(settings: settings, fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    final TiderEntity? entity = settings.arguments as TiderEntity?;
    return ReceiptScreen(entity);
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
