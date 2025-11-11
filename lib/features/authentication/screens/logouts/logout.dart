import 'package:trip_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:trip_store/features/authentication/screens/logouts/reponsive_screen/logout_desktop.dart';
import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSizeTemplate(desktop: LogoutDesktopScreen());
  }
}
