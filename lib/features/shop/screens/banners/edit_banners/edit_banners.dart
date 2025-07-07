import 'package:admin_t_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_t_store/features/shop/screens/banners/edit_banners/reponsive_screen/edit_banners_desktop.dart';
import 'package:flutter/material.dart';

class EditBannersScreen extends StatelessWidget {
  const EditBannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(desktop: EditBannersDesktopScreen());
  }
}
