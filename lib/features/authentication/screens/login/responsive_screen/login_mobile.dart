import 'package:admin_t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:admin_t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: const Column(
            children: [
              // Header
              TLoginHeader(),
              // Form
              TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
