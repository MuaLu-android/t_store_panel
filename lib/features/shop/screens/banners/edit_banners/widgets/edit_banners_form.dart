import 'package:admin_hmoob_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_hmoob_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_hmoob_store/features/shop/controllers/banner/edit_banner_controller.dart';
import 'package:admin_hmoob_store/features/shop/models/banner_model.dart';
import 'package:admin_hmoob_store/route/route.dart';
import 'package:admin_hmoob_store/utils/constants/colors.dart';
import 'package:admin_hmoob_store/utils/constants/enums.dart';
import 'package:admin_hmoob_store/utils/constants/image_strings.dart';
import 'package:admin_hmoob_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditBannersForm extends StatelessWidget {
  const EditBannersForm({super.key, required this.banner});
  final BannerModel banner;
  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = Get.put(EditBannerController());
    controller.init(banner);
    return TRoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Form(
        key: controller.formKey,
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
                Obx(
                  () => TRoundedImage(
                    width: 400,
                    height: 200,
                    imageUrl: controller.imageUrl.value.isNotEmpty
                        ? controller.imageUrl.value
                        : TImages.acerlogo,
                    imageType: controller.imageUrl.value.isNotEmpty
                        ? ImageType.network
                        : ImageType.asset,
                    backgroundColor: TColors.primaryBackground,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TextButton(
                  onPressed: () => controller.pickImage(),
                  child: const Text('Selected Images'),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Text(
              'Make your Banner Active or InActicve',
              style: Theme.of(Get.context!).textTheme.bodyMedium,
            ),
            Obx(
              () => CheckboxMenuButton(
                value: controller.isActive.value,
                onChanged: (value) =>
                    controller.isActive.value = value ?? false,
                child: const Text('Active'),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // Dropdown
            Obx(
              () => DropdownButton<String>(
                value: controller.targetSceen.value,
                onChanged: (String? neValue) =>
                    controller.targetSceen.value = neValue!,
                items: TRoutes.sidebarMenuItems.map<DropdownMenuItem<String>>((
                  item,
                ) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateBanners(banner),
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
