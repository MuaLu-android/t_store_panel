import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderCustomer extends StatelessWidget {
  const OrderCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Personal Info
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Customer',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                children: [
                  const TRoundedImage(
                    padding: 0,
                    backgroundColor: TColors.primaryBackground,
                    imageUrl: TImages.user,
                    imageType: ImageType.asset,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Coding with T',
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const Text(
                        'support@codingwitht.com',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        // Contact Info
        SizedBox(
          width: double.infinity,
          child: TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Person',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Text(
                  'Coding with t',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text(
                  'support@codingwitht.com',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text(
                  '(+44) *** ****',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        // Context Info
        SizedBox(
          width: double.infinity,
          child: TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Address',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Text(
                  'Taimoor Sikander LTD',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text(
                  '61 Gridge Street. Kingtop, United Kingdom',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        // Contact Info
        SizedBox(
          width: double.infinity,
          child: TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dilling Address',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Text(
                  'Taimoor Sikander LTD',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text(
                  '61 Gridge Street. Kingtop, United Kingdom',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
