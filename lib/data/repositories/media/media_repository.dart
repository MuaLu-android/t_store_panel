import 'dart:io';

import 'package:admin_t_store/features/media/models/image_modle.dart';
import 'package:admin_t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:admin_t_store/utils/exceptions/format_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart' as html;

class MediaRepository extends GetxController {
  static MediaRepository get onstance => Get.find();
  //Firebase Storage instance
  final FirebaseStorage _storage = FirebaseStorage.instance;
  //Upload any Image using File
  Future<ImageModle> uploadImageFileInStorage({
    required dynamic file,
    required String path,
    required String imageName,
  }) async {
    try {
      // Refernce to the storage location
      final Reference ref = _storage.ref('$path/$imageName');
      // Upload Image
      await ref.putData(file);
      // Get doeload URL
      final String downloadUrl = await ref.getDownloadURL();

      // Fetch metadata
      final FullMetadata metadata = await ref.getMetadata();
      return ImageModle.fromFirebaseMatedate(
        metadata,
        path,
        imageName,
        downloadUrl,
      );
    } on SocketException catch (e) {
      throw e.message;
    } on FirebaseException catch (e) {
      print("🔥 FirebaseException: ${e.code} - ${e.message}");
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } catch (e) {
      print("🔥 FirebaseException: ${e.toString()}");
      throw 'Something went wrong. Please try again';
    }
  }

  // Upload Image data in Firestore
  Future<String> uploadImageFileInDatabase(ImageModle image) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection("Images")
          .add(image.toJSon());
      return data.id;
    } on SocketException catch (e) {
      throw e.message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again: ${e.toString()}';
    }
  }
}
