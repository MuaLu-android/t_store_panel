import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_t_store/features/shop/screens/banners/data/banner_model.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditBannersForm extends StatelessWidget {
  const EditBannersForm({super.key, required this.bannerModel});
  final BannerModel bannerModel;
  @override
  Widget build(BuildContext context) {
    // implement build
    return TRoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            SizedBox(height: TSizes.sm),
            Text(
              'Update Banners',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Column(
              children: [
                GestureDetector(
                  child: const TRoundedImage(
                    width: 400,
                    height: 200,
                    imageUrl: TImages.acerlogo,
                    imageType: ImageType.asset,
                    backgroundColor: TColors.primaryBackground,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TextButton(
                  onPressed: () {},
                  child: const Text('Selected Images'),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Text(
              'Make your Banner Active or InActicve',
              style: Theme.of(Get.context!).textTheme.bodyMedium,
            ),
            CheckboxMenuButton(
              value: true,
              onChanged: (value) {},
              child: const Text('Active'),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // Dropdown
            DropdownButton<String>(
              value: 'search',
              onChanged: (String? neValue) {},
              items: [
                DropdownMenuItem<String>(value: 'home', child: Text('Home')),
                DropdownMenuItem<String>(
                  value: 'search',
                  child: Text('Search'),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Create'),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
