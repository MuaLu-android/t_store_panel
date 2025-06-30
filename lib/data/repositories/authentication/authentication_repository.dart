import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  // Firebase Auth Instance
  final _auth = FirebaseAuth.instance;

  // Get Authentication User Data
  User? get authUser => _auth.currentUser;

  // Get IsAuthentication User
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    // implement onReady
    _auth.setPersistence(Persistence.LOCAL);
    super.onReady();
  }

  // Login
  // Register
  // Register User By Admin
  // Email Verification
  // Foget Paswors
  // Re Authentication User
}
