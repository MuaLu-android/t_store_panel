import 'package:admin_t_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_t_store/features/shop/screens/banners/create_banners/reponsive_screen/create_banners_desktop.dart';
import 'package:flutter/material.dart';

class CreateBannersScreen extends StatelessWidget {
  const CreateBannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(desktop: CreateBannersDesktopScreen());
  }
}
