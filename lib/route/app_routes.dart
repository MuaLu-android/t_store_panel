import 'package:admin_t_store/app.dart';
import 'package:admin_t_store/features/authentication/screens/login/login.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:get/route_manager.dart';

class TAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: () => LoginScreen()),
    GetPage(name: TRoutes.firstScreen, page: () => FirstScreen()),
  ];
}
