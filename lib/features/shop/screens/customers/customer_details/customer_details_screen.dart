import 'package:admin_hmoob_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_hmoob_store/features/shop/screens/customers/customer_details/reponsive_screen/customer_details_desktop.dart';
import 'package:admin_hmoob_store/features/shop/screens/customers/customer_details/reponsive_screen/customer_details_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerDeatilsScreen extends StatelessWidget {
  const CustomerDeatilsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final customer = Get.arguments;
    final customerId = Get.parameters['customerId'];
    return TSizeTemplate(
      desktop: CustomerDetailsDesktopScreen(customer: customer),
      mobile: CustomerDetailsMobileScreen(customer: customer),
    );
  }
}
