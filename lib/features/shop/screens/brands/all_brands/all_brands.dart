import 'package:trip_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:trip_store/features/shop/screens/brands/all_brands/responsive_screen/brands_desktop_screen.dart';
import 'package:flutter/material.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(desktop: BrandsDesktopScreen());
  }
}
