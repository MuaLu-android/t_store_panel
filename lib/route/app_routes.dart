import 'package:admin_t_store/features/authentication/screens/login/forget_password/forget_password.dart';
import 'package:admin_t_store/features/authentication/screens/login/login.dart';
import 'package:admin_t_store/features/authentication/screens/reset_password/reset_password.dart';
import 'package:admin_t_store/features/media/screens/media/media.dart';
import 'package:admin_t_store/features/shop/screens/banners/all_banners/banners_screen.dart';
import 'package:admin_t_store/features/shop/screens/banners/create_banners/create_banners_screen.dart';
import 'package:admin_t_store/features/shop/screens/banners/edit_banners/edit_banners.dart';
import 'package:admin_t_store/features/shop/screens/brands/all_brands/all_brands.dart';
import 'package:admin_t_store/features/shop/screens/brands/create_brands/create_brands.dart';
import 'package:admin_t_store/features/shop/screens/brands/edit_brands/edit_brands.dart';
import 'package:admin_t_store/features/shop/screens/category/all_categories/category_screen.dart';
import 'package:admin_t_store/features/shop/screens/category/create_categories/categoris_create.dart';
import 'package:admin_t_store/features/shop/screens/category/edit_categories/edit_category.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/dashboard_screen.dart';
import 'package:admin_t_store/features/shop/screens/products/all_products/product_screen.dart';
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

    // Categories
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
    GetPage(
      name: TRoutes.editCategory,
      page: () => const EditCategoryScreen(),
      middlewares: [TRouteMiddleware()],
    ),
    // Brands
    GetPage(
      name: TRoutes.brands,
      page: () => const BrandsScreen(),
      middlewares: [TRouteMiddleware()],
    ),
    GetPage(
      name: TRoutes.createBrand,
      page: () => const CreateBrandsScreen(),
      middlewares: [TRouteMiddleware()],
    ),
    GetPage(
      name: TRoutes.editbrand,
      page: () => const EditBrandsScreen(),
      middlewares: [TRouteMiddleware()],
    ),
    GetPage(
      name: TRoutes.banners,
      page: () => const BannersScreen(),
      middlewares: [TRouteMiddleware()],
    ),
    GetPage(
      name: TRoutes.createBanner,
      page: () => const CreateBannersScreen(),
      middlewares: [TRouteMiddleware()],
    ),
    GetPage(
      name: TRoutes.editBanner,
      page: () => const EditBannersScreen(),
      middlewares: [TRouteMiddleware()],
    ),
    GetPage(
      name: TRoutes.products,
      page: () => const ProductScreen(),
      middlewares: [TRouteMiddleware()],
    ),
  ];
}
