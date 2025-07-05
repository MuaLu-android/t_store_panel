import 'package:admin_t_store/features/authentication/screens/login/forget_password/forget_password.dart';
import 'package:admin_t_store/features/authentication/screens/login/login.dart';
import 'package:admin_t_store/features/authentication/screens/reset_password/reset_password.dart';
import 'package:admin_t_store/features/media/screens/media/media.dart';
import 'package:admin_t_store/features/shop/screens/category/all_categories/category_screen.dart';
import 'package:admin_t_store/features/shop/screens/category/create_categories/categoris_create.dart';
import 'package:admin_t_store/features/shop/screens/category/create_categories/reponsive_screen/create_categorie_desktop.dart';
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
    GetPage(
      name: TRoutes.categories,
      page: () => const CategoryScreen(),
      middlewares: [TRouteMiddleware()],
    ),
    GetPage(
      name: TRoutes.createCategory,
      page: () => const CategorisCreateScreen(),
      middlewares: [TRouteMiddleware()],
    ),
  ];
}
