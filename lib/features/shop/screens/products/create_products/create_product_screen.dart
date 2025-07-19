import 'package:admin_hmoob_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_hmoob_store/features/shop/screens/products/create_products/reponsive_screen/create_product_desktop.dart';
import 'package:admin_hmoob_store/features/shop/screens/products/create_products/reponsive_screen/create_product_mobile.dart';
import 'package:flutter/material.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(
      desktop: CreateProductDesktopScreen(),
      mobile: CreateProductMobileScreen(),
    );
  }
}
