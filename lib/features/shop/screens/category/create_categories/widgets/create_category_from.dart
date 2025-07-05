import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/screens/category/create_categories/widgets/image_loader.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CreateCategoryFrom extends StatelessWidget {
  const CreateCategoryFrom({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TRoundedContainer(
      width: 500,
      padding: EdgeInsets.all(TSizes.defaultSpace),
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
            validator: (value) => TValidator.validateEmptyText('Name', value),
            decoration: const InputDecoration(
              labelText: 'Category Name',
              prefixIcon: Icon(Iconsax.category),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          DropdownButtonFormField(
            decoration: const InputDecoration(
              hintText: 'Parent Category',
              labelText: 'Parent Category',
              prefixIcon: Icon(Iconsax.bezier),
            ),
            items: [
              DropdownMenuItem(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Text('Iteam.name')],
                ),
              ),
            ],
            onChanged: (newValue) {},
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields * 2),
          TImageLoader(imageType: ImageType.asset),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          CheckboxMenuButton(
            value: true,
            onChanged: (value) {},
            child: const Text('Featured'),
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
    );
  }
}
