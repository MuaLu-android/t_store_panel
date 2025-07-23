import 'package:trip_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:trip_store/features/shop/screens/customers/all_customers/reponsive_screen/customer_desktop.dart';
import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(desktop: CustomerDesktopScreen());
  }
}
