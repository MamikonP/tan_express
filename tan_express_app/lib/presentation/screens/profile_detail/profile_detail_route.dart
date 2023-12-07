import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'profile_detail_screen.dart';


class ProfileDetailRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  ProfileDetailRoute({
    RouteSettings? settings,
    this.maintainState = true,
  }) : super(settings: settings, fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return const ProfileDetailScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
