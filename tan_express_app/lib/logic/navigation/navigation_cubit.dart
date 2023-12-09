import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  void changeNavBar(int index) => emit(NavigationNavBarUpdated(index));

  void pop(BuildContext context) => Navigator.of(context).pop();

  void popUntil(BuildContext context, String routeName) => Navigator.of(context)
      .popUntil((Route<dynamic> route) => route.settings.name == routeName);

  Future<T?>? push<T>(BuildContext context, String routeName,
          {Object? arguments}) =>
      Navigator.of(context).pushNamed(routeName, arguments: arguments);

  Future<T?>? pushReplace<T>(BuildContext context, String routeName,
          {Object? arguments}) =>
      Navigator.of(context)
          .pushReplacementNamed(routeName, arguments: arguments);

  Future<T?>? pushAndRemove<T>(BuildContext context, String routeName,
          {Object? arguments}) =>
      Navigator.of(context).pushNamedAndRemoveUntil(
          routeName, (Route<dynamic> route) => false,
          arguments: arguments);
}
