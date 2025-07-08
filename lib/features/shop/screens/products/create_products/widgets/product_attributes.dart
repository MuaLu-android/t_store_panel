import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/devices/device_utility.dart';
import 'package:admin_t_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: TColors.primaryBackground),
        const SizedBox(height: TSizes.spaceBtwSections),
        Text(
          'Add Product Attributes',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        // Form to add new attribute
        Form(
          child: TDeviceUtils.isDesktopScreen(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildAttrbuteName()),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(flex: 2, child: _buildAttributeTextField()),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    _buildAddAttributeButton(),
                  ],
                )
              : Column(
                  children: [
                    _buildAttrbuteName(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    _buildAttributeTextField(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    _buildAddAttributeButton(),
                  ],
                ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        // List of added attribute
        Text('All Attribute', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: TSizes.spaceBtwItems),
        // Display added attribute in a rouded container
        TRoundedContainer(
          backgroundColor: TColors.primaryBackground,
          child: Column(
            children: [buildAttributesList(context), buildEmptyAttributes()],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        // Generate Variations Button
        Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Generate Variations'),
              icon: const Icon(Iconsax.activity),
            ),
          ),
        ),
      ],
    );
  }

  // Build button to add a new attribute
  SizedBox _buildAddAttributeButton() {
    return SizedBox(
      width: 100,
      child: ElevatedButton.icon(
        onPressed: () {},
        label: const Text('Add'),
        icon: const Icon(Iconsax.add),
        style: ElevatedButton.styleFrom(
          foregroundColor: TColors.black,
          backgroundColor: TColors.secondary,
          side: const BorderSide(color: TColors.secondary),
        ),
      ),
    );
  }
  // Build text form field for attribute name

  TextFormField _buildAttrbuteName() {
    return TextFormField(
      validator: (value) =>
          TValidator.validateEmptyText('Attribute Name', value),
      decoration: const InputDecoration(
        labelText: 'Attribute Name',
        hintText: 'Colors, Sizes, Material',
      ),
    );
  }
  // Build text form field for attribute values

  SizedBox _buildAttributeTextField() {
    return SizedBox(
      height: 80,
      child: TextFormField(
        expands: true,
        maxLines: null,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.multiline,
        textAlignVertical: TextAlignVertical.top,
        validator: (value) =>
            TValidator.validateEmptyText('Attribute Field', value),
        decoration: const InputDecoration(
          labelText: 'Attribute',
          hintText:
              'Add attribute separted by | Example: Green | Blue | Yellow',
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  ListView buildAttributesList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          ),
          child: ListTile(
            title: const Text('Color'),
            subtitle: const Text('Green, Orange, Pink'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.trash, color: TColors.error),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
      itemCount: 3,
    );
  }

  Column buildEmptyAttributes() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TRoundedImage(
              width: 150,
              height: 80,
              imageType: ImageType.asset,
              imageUrl: TImages.defaultAttributeColorsImageIcon,
            ),
          ],
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Text('There are no attributes added for this products'),
      ],
    );
  }
}
