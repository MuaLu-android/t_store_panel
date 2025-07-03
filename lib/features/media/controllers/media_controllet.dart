import 'dart:io';
import 'dart:typed_data';

import 'package:admin_t_store/data/repositories/media/media_repository.dart';
import 'package:admin_t_store/features/media/models/image_modle.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/constants/text_strings.dart';
import 'package:admin_t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:admin_t_store/utils/exceptions/format_exceptions.dart';
import 'package:admin_t_store/utils/popups/dialogs.dart';
import 'package:admin_t_store/utils/popups/full_screen_loader.dart';
import 'package:admin_t_store/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();
  // bo dieu khien che do xem drop zone
  late DropzoneViewController dropzoneController;
  final RxBool showImagesUploaderSection = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
  final RxList<ImageModle> selectedImagesTopUpload = <ImageModle>[].obs;

  final RxList<ImageModle> allImages = <ImageModle>[].obs;
  final RxList<ImageModle> allBannerImages = <ImageModle>[].obs;
  final RxList<ImageModle> allProductImages = <ImageModle>[].obs;
  final RxList<ImageModle> allBrandImages = <ImageModle>[].obs;
  final RxList<ImageModle> allCategoryImages = <ImageModle>[].obs;
  final RxList<ImageModle> allUserIamges = <ImageModle>[].obs;

  final MediaRepository mediaRepository = MediaRepository();
  // selecLocalImages
  Future<void> selectLocalImages() async {
    final files = await dropzoneController.pickFiles(
      multiple: true,
      mime: ['image/jpeg', 'image/png'],
    );
    if (files.isNotEmpty) {
      for (var file in files) {
        final bytes = await dropzoneController.getFileData(file);
        final image = ImageModle(
          url: '',
          file: file,
          folder: '',
          filename: file.name,
          localImageToDisplay: Uint8List.fromList(bytes),
        );
        selectedImagesTopUpload.add(image);
      }
    }
  }

  // uploadImages
  void uploadImagesConfirmation() {
    if (selectedPath.value == MediaCategory.folders) {
      TLoaders.warningSnackBar(
        title: 'Select Folder',
        message: 'Please select the Folder in Order to upload the Images.',
      );
      return;
    }
    TDialogs.defaultDialog(
      context: Get.context!,
      title: 'Upload Images',
      confirmText: 'Upload',
      onConfirm: () async => await uploadImages(),
      content:
          'Are you sure you want to upload all the Image in ${selectedPath.value.name.toLowerCase()} folder',
    );
  }

  Future<void> uploadImages() async {
    try {
      // Remove confirmation box
      Get.back();
      // Loader
      uploadImagesLoader();
      // Get the selected category
      MediaCategory selectedCategory = selectedPath.value;
      // Get the corresponding list to update
      RxList<ImageModle> targetList;
      // Check the selected category and uplosd the corresponfing list
      switch (selectedCategory) {
        case MediaCategory.banners:
          targetList = allBannerImages;
          break;
        case MediaCategory.brands:
          targetList = allBrandImages;
          break;
        case MediaCategory.categories:
          targetList = allCategoryImages;
          break;
        case MediaCategory.products:
          targetList = allProductImages;
          break;
        case MediaCategory.users:
          targetList = allUserIamges;
          break;
        default:
          return;
      }
      // Upload and add images to the target list
      // Using a reverse loop to avoid 'Concurrent modification durng iteration' error
      for (int i = selectedImagesTopUpload.length - 1; i >= 0; i--) {
        var selectedImage = selectedImagesTopUpload[i];
        final image = selectedImage.file!;
        // Lấy Uint8List
        final bytes = await dropzoneController.getFileData(image);
        // Upload Image ti the Storage
        final ImageModle uploadeImage = await mediaRepository
            .uploadImageToCloudinary(
              file: bytes,
              path: getSelectedPath(),
              imageName: selectedImage.filename,
            );
        // Upload Image to the Firestỏe
        uploadeImage.mediaCategory = selectedCategory.name;
        final id = await mediaRepository.uploadImageFileInDatabase(
          uploadeImage,
        );
        uploadeImage.id = id;
        selectedImagesTopUpload.removeAt(i);
        targetList.add(uploadeImage);
      }
    } on SocketException catch (e) {
      throw e.message;
    } on FirebaseException catch (e) {
      print("🔥 FirebaseException: ${e.code} - ${e.message}");
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } catch (e, stackTrace) {
      // Stop Loader in csae of an error
      TFullScreenLoader.stopLoading();
      // Show a warning snack-bar for the error
      TLoaders.warningSnackBar(
        title: 'Error Uploang Images',
        message:
            'Something went wrong whike uploadong your images:${e.toString()}',
      );
      print('Upload error: $e\n$stackTrace');
    }
  }

  void uploadImagesLoader() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          title: const Text('Uplloading Images'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                TImages.uploadingImageIllustration,
                height: 300,
                width: 300,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text('Sit Tight, Your images are uploading'),
            ],
          ),
        ),
      ),
    );
  }

  String getSelectedPath() {
    final Map<MediaCategory, String> storagePaths = {
      MediaCategory.banners: TTexts.bannersStoragePath,
      MediaCategory.brands: TTexts.brandsStoragePath,
      MediaCategory.categories: TTexts.categoriesStoragePath,
      MediaCategory.products: TTexts.productsStoragePath,
      MediaCategory.users: TTexts.usersStoragePath,
    };
    return storagePaths[selectedPath.value] ?? 'Others';
  }
}
