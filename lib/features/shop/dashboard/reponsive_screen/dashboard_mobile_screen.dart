import 'package:admin_t_store/features/shop/dashboard/widgets/dashboard_card.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              TDashbosrCard(
                stas: 25,
                title: 'Sales total',
                subtitle: '\$365.6',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TDashbosrCard(
                stas: 15,
                title: 'Average Order Value',
                subtitle: '\$25',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TDashbosrCard(stas: 45, title: 'Total Oiders', subtitle: '36'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TDashbosrCard(stas: 2, title: 'Visitors', subtitle: '\$365.6'),
            ],
          ),
        ),
      ),
    );
  }
}
