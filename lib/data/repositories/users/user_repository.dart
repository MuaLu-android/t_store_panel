import 'package:admin_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:admin_t_store/features/shop/models/user_model.dart';
import 'package:admin_t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:admin_t_store/utils/exceptions/format_exceptions.dart';
import 'package:admin_t_store/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  // Function to save user data ti Firestore
  Future<void> ceateUser(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Function to fetch user details based ti Firestore
  Future<UserModel> fetchAdminDetails() async {
    try {
      final docSnapsnot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .get();
      return UserModel.fromSnapshot(docSnapsnot);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Function to fetch user details based ti Firestore
  Future<UserModel> fetchUsersDetails(String id) async {
    try {
      final docSnapsnot = await _db.collection('Users').doc(id).get();
      if (docSnapsnot.exists) {
        return UserModel.fromSnapshot(docSnapsnot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
