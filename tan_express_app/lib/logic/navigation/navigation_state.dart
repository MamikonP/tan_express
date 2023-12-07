part of 'navigation_cubit.dart';

sealed class NavigationState extends Equatable {
  NavigationState({this.index = 0});

  final int index;
  final PageController pageController = PageController();

  @override
  List<Object> get props => <Object>[index];
}

final class NavigationInitial extends NavigationState {}

final class NavigationNavBarUpdated extends NavigationState {
  NavigationNavBarUpdated(int index) : super(index: index);
}
