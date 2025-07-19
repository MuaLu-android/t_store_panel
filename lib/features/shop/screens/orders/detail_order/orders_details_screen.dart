import 'package:admin_hmoob_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_hmoob_store/features/shop/screens/orders/detail_order/reponsive_screen/order_details_desktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final order = Get.arguments;
    final orderId = Get.parameters['orderId'];
    return TSizeTemplate(desktop: OrderDetailsDesktop(orderModel: order));
  }
}
