import 'package:admin_t_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_t_store/features/shop/models/category_model.dart';
import 'package:admin_t_store/features/shop/screens/category/edit_categories/responsive_screen/edit_category_desktop.dart';
import 'package:admin_t_store/features/shop/screens/category/edit_categories/responsive_screen/edit_category_mobile.dart';
import 'package:admin_t_store/features/shop/screens/category/edit_categories/responsive_screen/edit_category_tablet.dart';
import 'package:flutter/material.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final category = CatedoryModel(id: '', name: '', iamge: 'iamge');
    return TSizeTemplate(
      desktop: EditCategoryDesktopScreen(catedoryModel: category),
      tablet: EditCategoryTabletScreen(),
      mobile: EditCategoryMobileScreen(),
    );
  }
}
