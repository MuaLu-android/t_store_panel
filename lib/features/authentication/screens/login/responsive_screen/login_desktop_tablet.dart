import 'package:admin_t_store/common/widgets/layouts/templates/login_template.dart';
import 'package:admin_t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:admin_t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginScreenDesktopTablet extends StatelessWidget {
  const LoginScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TLoginTemplate(
      child: Column(
        children: [
          // Header
          const TLoginHeader(),
          //Form
          const TLoginForm(),
        ],
      ),
    );
  }
}
