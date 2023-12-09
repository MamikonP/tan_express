import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/profile/profile_bloc.dart';
import 'profile_detail_screen.dart';

class ProfileDetailRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  ProfileDetailRoute({
    RouteSettings? settings,
    this.maintainState = true,
  }) : super(settings: settings, fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (BuildContext context) => ProfileBloc(),
      child: ProfileDetailScreen(),
    );
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
