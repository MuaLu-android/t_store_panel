import 'package:trip_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:trip_store/features/personalization/screen/settings/widgets/setting_form.dart';
import 'package:trip_store/features/personalization/screen/settings/widgets/setting_image_meta.dart';
import 'package:trip_store/l10n/app_localizations.dart';
import 'package:trip_store/utils/constants/breadcrumb_item.dart';
import 'package:trip_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SettingsMobilesScreen extends StatelessWidget {
  const SettingsMobilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breandcrumbs
              TBreadcrumbWithHeading(
                heading: local.settings,
                breadcrumbItems: [BreadcrumbItem(local.settings)],
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              // Body
              Expanded(child: Chip(label: SettingImageMeta())),
              const SizedBox(height: TSizes.spaceBtwSections),
              // From
              Expanded(flex: 2, child: SettingForm()),
            ],
          ),
        ),
      ),
    );
  }
}
