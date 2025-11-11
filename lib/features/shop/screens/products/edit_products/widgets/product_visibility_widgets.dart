import 'package:trip_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:trip_store/l10n/app_localizations.dart';
import 'package:trip_store/utils/constants/enums.dart';
import 'package:trip_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductVisibilityWidgets extends StatelessWidget {
  const ProductVisibilityWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final localizations = AppLocalizations.of(context)!;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Visibility Header
          Text(
            localizations.visibility,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          // Radio buttons for product visibility
          Column(
            children: [
              _buiidVisibilityRadioButton(
                ProductVisibility.published,
                localizations.published,
              ),
              _buiidVisibilityRadioButton(
                ProductVisibility.hidden,
                localizations.hidden,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buiidVisibilityRadioButton(ProductVisibility value, String s) {
    return RadioMenuButton<ProductVisibility>(
      value: value,
      groupValue: ProductVisibility.published,
      onChanged: (selection) {},
      child: Text(s),
    );
  }
}
