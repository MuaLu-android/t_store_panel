import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/features/shop/models/order_model.dart';
import 'package:admin_t_store/features/shop/screens/orders/detail_order/widgets/order_customer.dart';
import 'package:admin_t_store/features/shop/screens/orders/detail_order/widgets/order_info.dart';
import 'package:admin_t_store/features/shop/screens/orders/detail_order/widgets/order_items.dart';
import 'package:admin_t_store/features/shop/screens/orders/detail_order/widgets/order_transactions.dart';
import 'package:admin_t_store/l10n/app_localizations.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/breadcrumb_item.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderDetailsDesktop extends StatelessWidget {
  const OrderDetailsDesktop({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    // implement build
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breandcrombs
            TBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              heading: orderModel.id,
              breadcrumbItems: [
                BreadcrumbItem(local.brandsStoragePath, route: TRoutes.orders),
                BreadcrumbItem(local.orderDetailsBreadcrumb),
              ],
              titleSmall: true,
            ),
            // Body
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Side Order Information
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      // Order Info
                      OrderInfoScreen(orderModel: orderModel),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      // Items
                      OrderItems(orderModel: orderModel),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      // Transactions
                      OrderTransactions(orders: orderModel),
                    ],
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwSections),
                // Right Side Order
                Expanded(
                  child: Column(
                    children: [
                      // Customer Info
                      OrderCustomer(orders: orderModel),
                      const SizedBox(height: TSizes.spaceBtwSections),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
