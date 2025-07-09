import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_t_store/common/widgets/layouts/templates/loader_animation.dart';
import 'package:admin_t_store/features/media/controllers/media_controllet.dart';
import 'package:admin_t_store/features/media/models/image_modle.dart';
import 'package:admin_t_store/features/media/screens/media/widgets/folder_dropdown.dart';
import 'package:admin_t_store/features/media/screens/media/widgets/view_image_details.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MediaContent extends StatelessWidget {
  MediaContent({
    super.key,
    required this.allowSelection,
    required this.allowMoltipleSelection,
    this.alreadySelectedUrls,
    this.onImagesSelected,
  });
  final bool allowSelection;
  final bool allowMoltipleSelection;
  final List<String>? alreadySelectedUrls;
  final List<ImageModel> selectedImages = [];
  final Function(List<ImageModel> selectedImages)? onImagesSelected;
  @override
  Widget build(BuildContext context) {
    //implement build
    var loadedPreviousSection = false;
    final controller = MediaController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Folder Dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Select Folder',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  MediaFolderDropdown(
                    onChanged: (MediaCategory? newValue) {
                      if (newValue != null) {
                        controller.selectedPath.value = newValue;
                        controller.getMediaImages();
                      }
                    },
                  ),
                ],
              ),
              if (allowSelection) builAddSelectImagesButton(),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Obx(() {
            // get selected Folder Images
            List<ImageModel> images = _getSlectedFolderImages(controller);

            if (!loadedPreviousSection) {
              if (alreadySelectedUrls != null &&
                  alreadySelectedUrls!.isNotEmpty) {
                // Convert alreadySelectedUrls to a Set for faster lookup
                final selectedUrlsSet = Set<String>.from(alreadySelectedUrls!);
                for (var image in images) {
                  image.isSelected.value = selectedUrlsSet.contains(image.url);
                  if (image.isSelected.value) {
                    selectedImages.add(image);
                  }
                }
              } else {
                // set all images to not selected
                for (var image in images) {
                  image.isSelected.value = false;
                }
              }
              loadedPreviousSection = true;
            }
            // Loader
            if (controller.loading.value && images.isEmpty) {
              return const TLoaderAnimation();
            }
            // Empty Widget
            if (images.isEmpty) return _builEmptyAnimationWidget(context);
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: TSizes.spaceBtwItems / 2,
                  runSpacing: TSizes.spaceBtwItems / 2,
                  children: images
                      .map(
                        (image) => GestureDetector(
                          onTap: () => Get.dialog(ImagePopup(imae: image)),
                          child: SizedBox(
                            width: 140,
                            height: 180,
                            child: Column(
                              children: [
                                allowSelection
                                    ? _buildListWithCheckbox(image)
                                    : _buildSimpleList(image),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: TSizes.sm,
                                    ),
                                    child: Text(
                                      image.filename,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: TSizes.spaceBtwSections),

                /// Load More Media Button -> show all images
                if (!controller.loading.value)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwSections,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: TSizes.buttonWidth,
                          child: ElevatedButton.icon(
                            onPressed: () => controller.loadMoreMediaImages(),
                            label: const Text('Load More'),
                            icon: const Icon(Iconsax.arrow_down),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }

  List<ImageModel> _getSlectedFolderImages(MediaController controller) {
    List<ImageModel> images = [];
    if (controller.selectedPath.value == MediaCategory.banners) {
      images = controller.allBannerImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.brands) {
      images = controller.allBrandImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.categories) {
      images = controller.allCategoryImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.products) {
      images = controller.allProductImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.users) {
      images = controller.allUserIamges
          .where((image) => image.url.isNotEmpty)
          .toList();
    }
    return images;
  }

  Widget _builEmptyAnimationWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.lg * 3),
      child: TAnimationLoaderWidget(
        width: 300,
        height: 300,
        text: 'Select ypur Desired Folder',
        animation: TImages.packageAnimation,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildSimpleList(ImageModel image) {
    return TRoundedImage(
      width: 140,
      height: 140,
      padding: TSizes.sm,
      imageUrl: image.url,
      margin: TSizes.spaceBtwItems / 2,
      backgroundColor: TColors.primaryBackground,
      imageType: ImageType.network,
    );
  }

  Widget _buildListWithCheckbox(ImageModel image) {
    return Stack(
      children: [
        TRoundedImage(
          width: 140,
          height: 140,
          padding: TSizes.sm,
          imageUrl: image.url,
          imageType: ImageType.network,
          margin: TSizes.spaceBtwItems / 2,
          backgroundColor: TColors.primaryBackground,
        ),
        Positioned(
          top: TSizes.sm,
          right: TSizes.sm,
          child: Obx(
            () => Checkbox(
              value: image.isSelected.value,
              onChanged: (selected) {
                if (selected != null) {
                  image.isSelected.value = selected;
                  if (selected) {
                    if (!allowMoltipleSelection) {
                      // if multiple selection is not allowed, uncheck other checkboxes
                      for (var otherImage in selectedImages) {
                        if (otherImage != image) {
                          otherImage.isSelected.value = false;
                        }
                      }
                      selectedImages.clear();
                    }
                    selectedImages.add(image);
                  } else {
                    selectedImages.remove(image);
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget builAddSelectImagesButton() {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: OutlinedButton.icon(
            label: const Text('Close'),
            icon: Icon(Iconsax.close_circle),
            onPressed: () => Get.back(),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        SizedBox(
          width: 120,
          child: ElevatedButton.icon(
            onPressed: () => Get.back(result: selectedImages),
            label: const Text('Add'),
            icon: const Icon(Iconsax.image),
          ),
        ),
      ],
    );
  }
}
