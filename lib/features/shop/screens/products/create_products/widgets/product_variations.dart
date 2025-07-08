import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_t_store/features/shop/screens/category/create_categories/widgets/image_loader.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';

class ProductVariations extends StatelessWidget {
  const ProductVariations({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Variations Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Variations',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Remove Variations'),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          // Variations
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return _buildVariationTitle();
            },
            separatorBuilder: (_, __) =>
                const SizedBox(height: TSizes.spaceBtwItems),
            itemCount: 2,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          // No Variations message
          _buildNoVariationsMessage(),
        ],
      ),
    );
  }

  Widget _buildVariationTitle() {
    return ExpansionTile(
      backgroundColor: TColors.lightGrey,
      collapsedBackgroundColor: TColors.lightGrey,
      childrenPadding: const EdgeInsets.all(TSizes.md),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
      ),
      title: const Text('Color: Green, Size: small'),
      children: [
        // Up load Variation Image
        Obx(
          () => TImageUpLoader(
            right: 0,
            left: null,
            imageType: ImageType.asset,
            image: TImages.defaultImage,
            onIconButtonPressed: () {},
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        // Varistions Stock, and Pricing
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Stock',
                  hintText: 'Add Stock, only numbers are allowed',
                ),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d=\.?\d{0,2}$')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Price',
                  hintText: 'Price with up-to 2 decimals',
                ),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Discounted Price',
                  hintText: 'Price with up-to 2 decimals',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        // Variation Descriptio
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Description',
            hintText: 'Add description of this variation...',
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }

  // Helper method to build message when there are no variations
  Widget _buildNoVariationsMessage() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TRoundedImage(
              width: 200,
              height: 200,
              imageType: ImageType.asset,
              imageUrl: TImages.defaultVariationImageIcon,
            ),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Text('There are no Variations added for this product'),
      ],
    );
  }
}
