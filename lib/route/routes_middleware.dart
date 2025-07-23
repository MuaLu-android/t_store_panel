import 'package:trip_store/data/repositories/authentication/authentication_repository.dart';
import 'package:trip_store/route/route.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated
        ? null
        : const RouteSettings(name: TRoutes.login);
  }
}
