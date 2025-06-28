import 'package:admin_t_store/route/route.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final isAuthentication = true;
    return isAuthentication
        ? null
        : const RouteSettings(name: TRoutes.dashboard);
  }
}
