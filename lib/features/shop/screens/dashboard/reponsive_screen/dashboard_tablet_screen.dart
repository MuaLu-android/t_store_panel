import 'package:admin_t_store/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/widgets/order_status_piechart.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/widgets/recent_order.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/widgets/week_sales.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DashboardTabletScreen extends StatelessWidget {
  const DashboardTabletScreen({super.key});
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
              // Heding
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Cards
              Row(
                children: [
                  Expanded(
                    child: TDashbosrCard(
                      stas: 25,
                      title: 'Sales total',
                      subtitle: '\$365.6',
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashbosrCard(
                      stas: 15,
                      title: 'Average Order Value',
                      subtitle: '\$25',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    child: TDashbosrCard(
                      stas: 45,
                      title: 'Total Oiders',
                      subtitle: '36',
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashbosrCard(
                      stas: 2,
                      title: 'Visitors',
                      subtitle: '\$365.6',
                    ),
                  ),
                ],
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
