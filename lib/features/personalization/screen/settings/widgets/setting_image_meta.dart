import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/screens/category/create_categories/widgets/image_loader.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingImageMeta extends StatelessWidget {
  const SettingImageMeta({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TRoundedContainer(
      padding: const EdgeInsets.symmetric(
        vertical: TSizes.lg,
        horizontal: TSizes.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              //User image
              const TImageUpLoader(
                right: 10,
                bottom: 20,
                left: null,
                width: 200,
                height: 200,
                cricular: true,
                icon: Iconsax.camera,
                imageType: ImageType.asset,
                image: TImages.user,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text('T_STORE', style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ],
      ),
    );
  }
}
