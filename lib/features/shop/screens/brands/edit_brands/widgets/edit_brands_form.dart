import 'package:admin_t_store/common/widgets/chips/choice_chip.dart';
import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/screens/category/create_categories/widgets/image_loader.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class EditBrandsForm extends StatelessWidget {
  const EditBrandsForm({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TRoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          SizedBox(height: TSizes.sm),
          Text(
            'Update Brands',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          // Name Text Field
          TextFormField(
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
          Wrap(
            spacing: TSizes.xs,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: TSizes.sm),
                child: TChoiceChip(
                  text: 'Shoes',
                  selected: true,
                  onSelected: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: TSizes.sm),
                child: TChoiceChip(
                  text: 'Trudk Suits',
                  selected: true,
                  onSelected: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: TSizes.sm),
                child: TChoiceChip(
                  text: 'Jogger',
                  selected: false,
                  onSelected: (value) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields * 2),
          TImageUpLoader(
            width: 80,
            height: 80,
            image: TImages.defaultImage,
            onIconButtonPressed: () {},
            imageType: ImageType.asset,
          ),
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
              child: const Text('Update'),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields * 2),
        ],
      ),
    );
  }
}
