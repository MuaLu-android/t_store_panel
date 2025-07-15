import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/features/shop/models/user_model.dart';
import 'package:admin_t_store/features/shop/screens/customers/customer_details/widgets/customer_info.dart';
import 'package:admin_t_store/features/shop/screens/customers/customer_details/widgets/customer_order.dart';
import 'package:admin_t_store/features/shop/screens/customers/customer_details/widgets/shipping_address.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomerDetailsMobileScreen extends StatelessWidget {
  const CustomerDetailsMobileScreen({super.key, required this.customer});
  final UserModel customer;
  @override
  Widget build(BuildContext context) {
    // implement build
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
                breadcrumbItems: [TRoutes.customers, 'Details'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              CustomerInfo(customer: customer),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Shipping Address
              const ShippingAddress(),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Right Side Customer
              CustomerOrders(),
            ],
          ),
        ),
      ),
    );
  }
}
