import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_t_store/common/widgets/layouts/templates/loader_animation.dart';
import 'package:admin_t_store/features/media/controllers/media_controllet.dart';
import 'package:admin_t_store/features/media/models/image_modle.dart';
import 'package:admin_t_store/features/media/screens/media/widgets/folder_dropdown.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    //implement build
    final controller = MediaController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Folder Dropdown
          Row(
            children: [
              Row(
                children: [
                  Text(
                    'Gallery Folder',
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
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Obx(() {
            // get selected Folder Images
            List<ImageModle> images = _getSlectedFolderImages(controller);
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
                          onTap: () {},
                          child: SizedBox(
                            width: 140,
                            height: 180,
                            child: Column(
                              children: [
                                _buildSimpleList(image),
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

  List<ImageModle> _getSlectedFolderImages(MediaController controller) {
    List<ImageModle> images = [];
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

  Widget _buildSimpleList(ImageModle image) {
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
}
