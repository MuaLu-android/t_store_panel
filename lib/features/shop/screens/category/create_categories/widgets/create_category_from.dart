import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/shimmer/shimmer.dart';
import 'package:admin_t_store/features/shop/controllers/categories/category_controller.dart';
import 'package:admin_t_store/features/shop/controllers/categories/create_category_controller.dart';
import 'package:admin_t_store/features/shop/screens/category/create_categories/widgets/image_loader.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CreateCategoryFrom extends StatelessWidget {
  const CreateCategoryFrom({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = Get.put(CreateCategoryController());
    final categoryController = CategoryController.instance;
    return TRoundedContainer(
      width: 500,
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            SizedBox(height: TSizes.sm),
            Text(
              'Create New Category',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            // Name Text Field
            TextFormField(
              controller: controller.name,
              validator: (value) => TValidator.validateEmptyText('Name', value),
              decoration: const InputDecoration(
                labelText: 'Category Name',
                prefixIcon: Icon(Iconsax.category),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Categories Dropdown
            Obx(
              () => categoryController.isLoading.value
                  ? const TShimmerEffect(width: double.infinity, height: 55)
                  : DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: 'Parent Category',
                        labelText: 'Parent Category',
                        prefixIcon: Icon(Iconsax.bezier),
                      ),
                      items: categoryController.allItems
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [Text(item.name)],
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (newValue) =>
                          controller.selectedParent.value = newValue!,
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
                imageType: controller.imageUrl.isNotEmpty
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
                onPressed: () => controller.createCategory(),
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
