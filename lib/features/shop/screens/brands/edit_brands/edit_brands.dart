import 'package:admin_t_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_t_store/features/shop/screens/brands/edit_brands/responsive_screen/edit_brands_desktop.dart';
import 'package:flutter/material.dart';

class EditBrandsScreen extends StatelessWidget {
  const EditBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(desktop: EditBrandsDesktop());
  }
}
