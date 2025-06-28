import 'package:admin_t_store/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ResetPasswordMobile extends StatelessWidget {
  const ResetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: ResetPasswordWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
