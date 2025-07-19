import 'package:admin_hmoob_store/common/widgets/chips/choice_chip.dart';
import 'package:admin_hmoob_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_hmoob_store/features/shop/controllers/brands/create_brands_controller.dart';
import 'package:admin_hmoob_store/features/shop/controllers/categories/category_controller.dart';
import 'package:admin_hmoob_store/features/shop/screens/category/create_categories/widgets/image_loader.dart';
import 'package:admin_hmoob_store/utils/constants/enums.dart';
import 'package:admin_hmoob_store/utils/constants/image_strings.dart';
import 'package:admin_hmoob_store/utils/constants/sizes.dart';
import 'package:admin_hmoob_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CreateBrandsForm extends StatelessWidget {
  const CreateBrandsForm({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = Get.put(CreateBrandsController());
    final categoryController = CategoryController.instance;
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
              'Create New Brands',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            // Name Text Field
            TextFormField(
              controller: controller.name,
              validator: (value) => TValidator.validateEmptyText('Name', value),
              decoration: const InputDecoration(
                labelText: 'Brands Name',
                prefixIcon: Icon(Iconsax.category),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Categories
            Text(
              'Selected Categories',
              style: Theme.of(Get.context!).textTheme.titleMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            Obx(
              () => Wrap(
                spacing: TSizes.xs,
                children: categoryController.allItems
                    .map(
                      (item) => Padding(
                        padding: EdgeInsets.only(bottom: TSizes.sm),
                        child: TChoiceChip(
                          text: item.name,
                          selected: controller.selectedCategories.contains(
                            item,
                          ),
                          onSelected: (value) => controller.toglSelection(item),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
            Obx(
              () => TImageUpLoader(
                width: 80,
                height: 80,
                image: controller.imageUrl.value.isNotEmpty
                    ? controller.imageUrl.value
                    : TImages.defaultImage,
                onIconButtonPressed: () => controller.pickImage(),
                imageType: controller.imageUrl.value.isNotEmpty
                    ? ImageType.network
                    : ImageType.asset,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Obx(
              () => CheckboxMenuButton(
                value: controller.isFeatured.value,
                onChanged: (value) =>
                    controller.isFeatured.value = value ?? false,
                child: const Text('Featured'),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.createBrands(),
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
