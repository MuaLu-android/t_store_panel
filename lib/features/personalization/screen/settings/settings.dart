import 'package:admin_t_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_t_store/features/personalization/screen/settings/reponsive_screen/setting_mobile.dart';
import 'package:admin_t_store/features/personalization/screen/settings/reponsive_screen/settings_desktop.dart';
import 'package:flutter/material.dart';

class SettingsSreen extends StatelessWidget {
  const SettingsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(
      desktop: SettingsDesktopScreen(),
      mobile: SettingsMobilesScreen(),
    );
  }
}
