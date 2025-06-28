import 'package:admin_t_store/common/widgets/layouts/templates/login_template.dart';
import 'package:admin_t_store/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordDesktopTablet extends StatelessWidget {
  const ResetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TLoginTemplate(child: ResetPasswordWidget());
  }
}
