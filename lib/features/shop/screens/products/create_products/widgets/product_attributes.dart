import 'package:admin_hmoob_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_hmoob_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_hmoob_store/features/shop/controllers/products/create_product_controller.dart';
import 'package:admin_hmoob_store/features/shop/controllers/products/product_attribute_controller.dart';
import 'package:admin_hmoob_store/features/shop/controllers/products/products_variation_controller.dart';
import 'package:admin_hmoob_store/utils/constants/colors.dart';
import 'package:admin_hmoob_store/utils/constants/enums.dart';
import 'package:admin_hmoob_store/utils/constants/image_strings.dart';
import 'package:admin_hmoob_store/utils/constants/sizes.dart';
import 'package:admin_hmoob_store/utils/devices/device_utility.dart';
import 'package:admin_hmoob_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = CreateProductController.instance;
    final attributeController = Get.put(ProductAttributeController());
    final variationController = Get.put(ProductVariationController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return controller.productType.value == ProductType.single
              ? Column(
                  children: [
                    const Divider(color: TColors.primaryBackground),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                )
              : const SizedBox.shrink();
        }),
        Text(
          'Add Product Attributes',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        // Form to add new attribute
        Form(
          key: attributeController.attributesFormKeys,
          child: TDeviceUtils.isDesktopScreen(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildAttrbuteName(attributeController)),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      flex: 2,
                      child: _buildAttributes(attributeController),
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    _buildAddAttributeButton(attributeController),
                  ],
                )
              : Column(
                  children: [
                    _buildAttrbuteName(attributeController),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    _buildAttributes(attributeController),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    _buildAddAttributeButton(attributeController),
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
            children: [buildAttributesList(context, attributeController)],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        // Generate Variations Button
        Obx(
          () =>
              controller.productType.value == ProductType.single &&
                  variationController.productVariations.isEmpty
              ? Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton.icon(
                      onPressed: () => variationController
                          .generateVariationsConfirmation(context),
                      label: const Text('Generate Variations'),
                      icon: const Icon(Iconsax.activity),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  // Build button to add a new attribute
  SizedBox _buildAddAttributeButton(ProductAttributeController controller) {
    return SizedBox(
      width: 100,
      child: ElevatedButton.icon(
        onPressed: () => controller.addNewAttributes(),
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

  TextFormField _buildAttrbuteName(ProductAttributeController controller) {
    return TextFormField(
      controller: controller.attributeNames,
      validator: (value) =>
          TValidator.validateEmptyText('Attribute Name', value),
      decoration: const InputDecoration(
        labelText: 'Attribute Name',
        hintText: 'Colors, Sizes, Material',
      ),
    );
  }
  // Build text form field for attribute values

  SizedBox _buildAttributes(ProductAttributeController controller) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        controller: controller.attributes,
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

  Widget buildAttributesList(
    BuildContext context,
    ProductAttributeController controller,
  ) {
    return Obx(
      () => controller.productAttributes.isNotEmpty
          ? ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                  ),
                  child: ListTile(
                    title: Text(controller.productAttributes[index].name ?? ''),
                    subtitle: Text(
                      controller.productAttributes[index].value!
                          .map((item) => item.trim())
                          .toString(),
                    ),
                    trailing: IconButton(
                      onPressed: () =>
                          controller.removeAttributes(index, context),
                      icon: const Icon(Iconsax.trash, color: TColors.error),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) =>
                  const SizedBox(height: TSizes.spaceBtwItems),
              itemCount: controller.productAttributes.length,
            )
          : const Column(
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
            ),
    );
  }
}
