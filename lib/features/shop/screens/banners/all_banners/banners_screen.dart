import 'package:admin_t_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_t_store/features/shop/screens/banners/all_banners/reponsive_screen/desktop_banner_screen.dart';
import 'package:flutter/material.dart';

class BannersScreen extends StatelessWidget {
  const BannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(desktop: DesktopBannerScreen());
  }
}
