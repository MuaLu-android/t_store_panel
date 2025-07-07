import 'package:admin_t_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_t_store/features/shop/screens/brands/create_brands/responsive_screen/create_brands_desktop.dart';
import 'package:flutter/material.dart';

class CreateBrandsScreen extends StatelessWidget {
  const CreateBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(desktop: CreateBrandsDesktop());
  }
}
