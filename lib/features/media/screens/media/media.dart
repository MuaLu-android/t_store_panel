import 'package:admin_hmoob_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_hmoob_store/features/media/screens/media/reponsive_screen/media_desktop.dart';
import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TSizeTemplate(desktop: MediaDesktopScreen());
  }
}
