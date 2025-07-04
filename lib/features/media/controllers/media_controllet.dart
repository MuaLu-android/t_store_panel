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
import 'package:admin_t_store/utils/loaders/circular_loader.dart';
import 'package:admin_t_store/utils/popups/dialogs.dart';
import 'package:admin_t_store/utils/popups/full_screen_loader.dart';
import 'package:admin_t_store/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  final RxBool loading = false.obs;
  final int inittialLoadCount = 20;
  final int laodMoreCount = 25;
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

  // Get Images
  void getMediaImages() async {
    try {
      loading.value = true;
      RxList<ImageModle> targetList = <ImageModle>[].obs;
      if (selectedPath.value == MediaCategory.banners &&
          allBannerImages.isEmpty) {
        targetList = allBannerImages;
      } else if (selectedPath.value == MediaCategory.brands &&
          allBrandImages.isEmpty) {
        targetList = allBrandImages;
      } else if (selectedPath.value == MediaCategory.categories &&
          allCategoryImages.isEmpty) {
        targetList = allCategoryImages;
      } else if (selectedPath.value == MediaCategory.products &&
          allProductImages.isEmpty) {
        targetList = allProductImages;
      } else if (selectedPath.value == MediaCategory.users &&
          allUserIamges.isEmpty) {
        targetList = allUserIamges;
      }
      final images = await mediaRepository.fetchImagesFromDatabase(
        selectedPath.value,
        inittialLoadCount,
      );
      targetList.assignAll(images);
      loading.value = false;
    } catch (e) {
      loading.value = false;
      TLoaders.errorSnackBar(
        title: 'Oh snap',
        message: 'Unable to fetch Images, Something wrnt wrong. Try again',
      );
    }
  }

  // Load more Image
  void loadMoreMediaImages() async {
    try {
      loading.value = true;
      RxList<ImageModle> targetList = switch (selectedPath.value) {
        MediaCategory.banners => allBannerImages,
        MediaCategory.brands => allBrandImages,
        MediaCategory.categories => allCategoryImages,
        MediaCategory.products => allProductImages,
        MediaCategory.users => allUserIamges,
        _ => <ImageModle>[].obs,
      };
      if (selectedPath.value == MediaCategory.banners) {
        targetList = allBannerImages;
      } else if (selectedPath.value == MediaCategory.brands) {
        targetList = allBrandImages;
      } else if (selectedPath.value == MediaCategory.categories) {
        targetList = allCategoryImages;
      } else if (selectedPath.value == MediaCategory.products) {
        targetList = allProductImages;
      } else if (selectedPath.value == MediaCategory.users) {
        targetList = allUserIamges;
      }
      final images = await mediaRepository.loadMoreImagesFromDatabase(
        selectedPath.value,
        inittialLoadCount,
        targetList.last.createAt ?? DateTime.now(),
      );
      targetList.addAll(images);
      loading.value = false;
    } catch (e) {
      loading.value = false;
      TLoaders.errorSnackBar(
        title: 'Oh snap',
        message: 'Unable to fetch Images, Something wrnt wrong. Try again',
      );
    }
  }

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
    } finally {
      Get.back();
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

  // Popup confirmation to remove cloud image
  void removeCloudImageConfirmation(ImageModle image) {
    // Delete Confirmation
    TDialogs.defaultDialog(
      context: Get.context!,
      content: 'Are you sure you want to delete this image?',
      onConfirm: () {
        Get.back();
        removeClouImage(image);
      },
      onCancel: () => Get.back(),
    );
  }

  void removeClouImage(ImageModle image) async {
    try {
      Get.back();
      // Show Loader
      Get.defaultDialog(
        title: '',
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const PopScope(
          canPop: false,
          child: SizedBox(width: 150, height: 150, child: TCircularLoader()),
        ),
      );
      // Delete Image
      await mediaRepository.deleteFileFromCloudinaryAndFireStore(image);
      // Check the selected category and update the corresponding list
      RxList<ImageModle> targetList = switch (selectedPath.value) {
        MediaCategory.banners => allBannerImages,
        MediaCategory.brands => allBrandImages,
        MediaCategory.categories => allCategoryImages,
        MediaCategory.products => allProductImages,
        MediaCategory.users => allUserIamges,
        _ => <ImageModle>[].obs,
      };
      // Remove form the list
      targetList.remove(image);
      update();
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Image Deleted',
        message: 'Image successfully deleted from your cloud storage',
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
