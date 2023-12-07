// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

import '../../presentation/screens/home/home_route.dart';
import '../../presentation/screens/profile_detail/profile_detail_route.dart';
import '../../presentation/screens/receipt/receipt_route.dart';
import 'app_routes.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings,
      {dynamic arguments}) {
    switch (settings.name) {
      case AppRoutes.home:
        return HomeRoute<dynamic>();
      case AppRoutes.receipt:
        return ReceiptRoute<dynamic>();
      case AppRoutes.details:
        return ProfileDetailRoute<dynamic>();
      default:
        throw Exception('Route not found!');
    }
  }
}
