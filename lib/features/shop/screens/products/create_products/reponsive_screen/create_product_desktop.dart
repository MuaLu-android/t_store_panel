import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/controllers/products/create_product_controller.dart';
import 'package:admin_t_store/features/shop/controllers/products/product_images_controller.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_additional_images.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_attributes.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_bottom_navigation_button.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_brands.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_categories.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_stock_pricing.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_thumbnail_image.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_title_and_description.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_type_widget.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_variations.dart';
import 'package:admin_t_store/features/shop/screens/products/create_products/widgets/product_visibility_widgets.dart';
import 'package:admin_t_store/l10n/app_localizations.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/breadcrumb_item.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProductDesktopScreen extends StatelessWidget {
  const CreateProductDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = Get.put(CreateProductController());
    final productImagesController = Get.put(ProductImagesController());
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      bottomNavigationBar: const ProductBottomNavigationButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breandcrumbs
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: local.productCreateHeading,
                breadcrumbItems: [
                  BreadcrumbItem(
                    local.productsStoragePath,
                    route: TRoutes.products,
                  ),
                  BreadcrumbItem(local.productCreateHeading),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Create Products
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: TDeviceUtils.isTabletScreen(context) ? 2 : 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Basic Information
                        const ProductTitleAndDescription(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        // Stock and Pricing
                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Heading
                              Text(
                                'Stock & Pricing',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              // Product Type
                              const ProductTypeWidget(),
                              const SizedBox(
                                height: TSizes.spaceBtwInputFields,
                              ),
                              // Stock
                              const ProductStockAndPricing(),
                              const SizedBox(height: TSizes.spaceBtwSections),
                              // Attributes
                              const ProductAttributes(),
                              const SizedBox(height: TSizes.spaceBtwSections),
                            ],
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        // Varistions
                        const ProductVariations(),
                      ],
                    ),
                  ),
                  const SizedBox(width: TSizes.defaultSpace),
                  // Sidebar
                  Expanded(
                    child: Column(
                      children: [
                        // Product Thubnail
                        const ProductThumbnailImage(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        // Product Images
                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'All Product Images',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),

                              // ProductAdditionalImage
                              ProductAdditionalImages(
                                additionalProductImagesURLs:
                                    productImagesController
                                        .additionalProductImagesUrl,
                                onTapToAddImages: () => productImagesController
                                    .selectedMultipleproductImages(),
                                onTapToRemoveImage: (index) =>
                                    productImagesController.removeImges(index),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        // Product bar
                        const ProductBrandsScreen(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        // Product Categories
                        const ProductCategoriesScreen(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        // Product Visibility
                        const ProductVisibilityWidgets(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
