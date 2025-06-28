import 'package:admin_t_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_t_store/features/authentication/screens/login/forget_password/reponsive_screen/forget_password_desktop_tablet.dart';
import 'package:admin_t_store/features/authentication/screens/login/forget_password/reponsive_screen/forget_password_mobile.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(
      useLayout: false,
      desktop: ForgetPasswordDesktopTablet(),
      mobile: ForgetPasswordMobile(),
    );
  }
}
