import 'package:admin_t_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_t_store/features/authentication/screens/reset_password/responsive_screen/reset_password_desktop_tablet.dart';
import 'package:admin_t_store/features/authentication/screens/reset_password/responsive_screen/reset_password_mobile.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(
      useLayout: false,
      desktop: ResetPasswordDesktopTablet(),
      mobile: ResetPasswordMobile(),
    );
  }
}
