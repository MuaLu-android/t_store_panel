import 'package:admin_hmoob_store/common/widgets/layouts/templates/login_template.dart';
import 'package:admin_hmoob_store/features/authentication/screens/login/forget_password/widgets/header_from.dart';
import 'package:flutter/material.dart';

class ForgetPasswordDesktopTablet extends StatelessWidget {
  const ForgetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TLoginTemplate(child: HeaderAndForm());
  }
}
