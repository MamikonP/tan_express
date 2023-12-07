abstract class NavigationRouter {
  void pop();
  void popUntil(String routeName);
  Future<T?>? push<T>(String routeName, {Object? arguments});
  Future<T?>? pushReplace<T>(String routeName, {Object? arguments});
  Future<T?>? pushAndRemove<T>(String routeName, {Object? arguments});
}
