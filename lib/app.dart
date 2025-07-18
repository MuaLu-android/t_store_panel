import 'package:admin_t_store/bindings/general_binding.dart';
import 'package:admin_t_store/l10n/app_localizations.dart';
import 'package:admin_t_store/route/app_routes.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/text_strings.dart';
import 'package:admin_t_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      initialRoute: TRoutes.dashboard,
      getPages: TAppRoute.pages,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => const Scaffold(body: Center(child: Text('Page Not Found'))),
      ),
      // i18n
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('vi'),
    );
  }
}
