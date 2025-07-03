import 'package:admin_t_store/features/authentication/screens/login/forget_password/forget_password.dart';
import 'package:admin_t_store/features/authentication/screens/login/login.dart';
import 'package:admin_t_store/features/authentication/screens/reset_password/reset_password.dart';
import 'package:admin_t_store/features/media/screens/media/media.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/dashboard_screen.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/route/routes_middleware.dart';
import 'package:get/route_manager.dart';

class TAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: () => LoginScreen()),
    GetPage(name: TRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(
      name: TRoutes.dashboard,
      page: () => const DashBoardScreen(),
      middlewares: [TRouteMiddleware()],
    ),
    GetPage(
      name: TRoutes.media,
      page: () => const MediaScreen(),
      middlewares: [TRouteMiddleware()],
    ),
  ];
}
