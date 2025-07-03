// ignore_for_file: deprecated_member_use

import 'dart:typed_data';
import 'package:admin_t_store/features/media/models/image_modle.dart';

import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_t_store/features/media/controllers/media_controllet.dart';
import 'package:admin_t_store/features/media/screens/media/widgets/folder_dropdown.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    // goi truc tiep bo diue khien phuogn tien, truong hop nay vi
    final controller = MediaController.instance;
    return Obx(
      () => controller.showImagesUploaderSection.value
          ? Column(
              children: [
                /// Drag and Drop Area
                TRoundedContainer(
                  height: 250,
                  showBorder: true,
                  borderColor: TColors.borderPrimary,
                  backgroundColor: TColors.primaryBackground,
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            DropzoneView(
                              mime: ['images/jpeg', 'image/png'],
                              cursor: CursorType.Default,
                              operation: DragOperation.copy,
                              onLoaded: () => print('Zone loaded'),
                              onError: (ev) => print('Zone error: $ev'),
                              onHover: () => print('Zone hovered'),
                              onLeave: () => print('Sone left'),
                              onCreated: (ctrl) =>
                                  controller.dropzoneController = ctrl,
                              onDropInvalid: (ev) =>
                                  print('Zone invalid MINE: $ev'),
                              onDropMultiple: (ev) async {
                                print('Zone drop multiple: $ev');
                              },
                              onDrop: (file) async {
                                // chuyen doi ve UistList8
                                if (file) {
                                  final bytes = await controller
                                      .dropzoneController
                                      .getFileData(file);
                                  final image = ImageModle(
                                    url: '',
                                    file: file,
                                    folder: '',
                                    filename: file.name,
                                    localImageToDisplay: Uint8List.fromList(
                                      bytes,
                                    ),
                                  );
                                  controller.selectedImagesTopUpload.add(image);
                                } else if (file is String) {
                                  print('Zone drop: $file');
                                } else {
                                  print(
                                    'Zone unknow type: ${file.runtimeType}',
                                  );
                                }
                              },
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  TImages.defaultMultiImageIcon,
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(height: TSizes.spaceBtwItems),
                                const Text('Drag and Drop Images here'),
                                const SizedBox(height: TSizes.spaceBtwItems),
                                OutlinedButton(
                                  onPressed: () =>
                                      controller.selectLocalImages(),
                                  child: const Text('Select Images'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                // Deading and Locally selected Images
                if (controller.selectedImagesTopUpload.isNotEmpty)
                  TRoundedContainer(
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
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                MediaFolderDropdown(
                                  onChanged: (MediaCategory? newValue) {
                                    if (newValue != null) {
                                      controller.selectedPath.value = newValue;
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () => controller
                                      .selectedImagesTopUpload
                                      .clear(),
                                  child: const Text('Remove All'),
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                TDeviceUtils.isMobileScreen(context)
                                    ? const SizedBox.shrink()
                                    : SizedBox(
                                        width: TSizes.buttonWidth,
                                        child: ElevatedButton(
                                          onPressed: () => controller
                                              .uploadImagesConfirmation(),
                                          child: const Text('Upload'),
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: TSizes.spaceBtwItems / 2,
                          runSpacing: TSizes.spaceBtwItems / 2,
                          children: controller.selectedImagesTopUpload
                              .where(
                                (image) => image.localImageToDisplay != null,
                              )
                              .map(
                                (element) => TRoundedImage(
                                  width: 90,
                                  height: 90,
                                  padding: TSizes.sm,
                                  imageType: ImageType.memory,
                                  memoryImage: element.localImageToDisplay,
                                  backgroundColor: TColors.primaryBackground,
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        TDeviceUtils.isMobileScreen(context)
                            ? SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () =>
                                      controller.uploadImagesConfirmation(),
                                  child: Text('Upload'),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
