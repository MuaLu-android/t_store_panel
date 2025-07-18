import 'package:admin_t_store/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/widgets/order_status_piechart.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/widgets/recent_order.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/widgets/week_sales.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    // implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.spaceBtwItems),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heding
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Cards
              Expanded(
                child: Obx(
                  () => TDashbosrCard(
                    headingIcons: Iconsax.note,
                    headingIconColors: Colors.blue,
                    headingIconBgColor: Colors.blue.withAlpha(50),
                    context: context,
                    stas: 25,
                    title: 'Sales total',
                    subtitle:
                        '\$${controller.orderController.allItems.fold(0.0, (previousValue, element) => previousValue + element.totalAmount).toStringAsFixed(2)}',
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Expanded(
                child: Obx(
                  () => TDashbosrCard(
                    headingIcons: Iconsax.external_drive,
                    headingIconColors: Colors.green,
                    headingIconBgColor: Colors.green.withAlpha(50),
                    context: context,
                    stas: 15,
                    title: 'Average Order Value',
                    subtitle:
                        '\$${(controller.orderController.allItems.fold(0.0, (previousValue, element) => previousValue + element.totalAmount) / controller.orderController.allItems.length).toStringAsFixed(2)}',
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Expanded(
                child: Obx(
                  () => TDashbosrCard(
                    headingIcons: Iconsax.box,
                    headingIconColors: Colors.deepPurple,
                    headingIconBgColor: Colors.deepPurple.withAlpha(50),
                    context: context,
                    stas: 45,
                    title: 'Total Oiders',
                    subtitle: '\$${controller.orderController.allItems.length}',
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Expanded(
                child: Obx(
                  () => TDashbosrCard(
                    headingIcons: Iconsax.user,
                    headingIconColors: Colors.deepOrange,
                    headingIconBgColor: Colors.deepOrange.withAlpha(50),
                    context: context,
                    stas: 2,
                    title: 'Visitors',
                    subtitle:
                        '\$${controller.customerContrller.allItems.length.toString()}',
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Graphs
              const TWeeklySalesGraph(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Orders
              const TRecentOrderScreen(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Pie Chart
              const OrderStatusPiechart(),
            ],
          ),
        ),
      ),
    );
  }
}
