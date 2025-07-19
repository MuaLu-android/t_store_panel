import 'package:admin_hmoob_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_hmoob_store/features/shop/controllers/customer/customer_details_controller.dart';
import 'package:admin_hmoob_store/features/shop/models/user_model.dart';
import 'package:admin_hmoob_store/features/shop/screens/customers/customer_details/widgets/customer_info.dart';
import 'package:admin_hmoob_store/features/shop/screens/customers/customer_details/widgets/customer_order.dart';
import 'package:admin_hmoob_store/features/shop/screens/customers/customer_details/widgets/shipping_address.dart';
import 'package:admin_hmoob_store/l10n/app_localizations.dart';
import 'package:admin_hmoob_store/route/route.dart';
import 'package:admin_hmoob_store/utils/constants/breadcrumb_item.dart';
import 'package:admin_hmoob_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerDetailsDesktopScreen extends StatelessWidget {
  const CustomerDetailsDesktopScreen({super.key, required this.customer});
  final UserModel customer;
  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = Get.put(CustomerDetailController());
    final local = AppLocalizations.of(context)!;
    controller.customer.value = customer;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breandcrumbs
              TBreadcrumbWithHeading(
                heading: customer.fullName,
                breadcrumbItems: [
                  BreadcrumbItem(
                    local.usersStoragePath,
                    route: TRoutes.customers,
                  ),
                  BreadcrumbItem(local.customerDetailsBreadcrumb),
                ],
                returnToPreviousScreen: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        // Customer info
                        CustomerInfo(customer: customer),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        // Shipping Address
                        const ShippingAddress(),
                      ],
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwSections),
                  // Right Side Customer
                  const Expanded(flex: 2, child: CustomerOrders()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
