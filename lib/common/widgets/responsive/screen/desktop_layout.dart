import 'package:admin_t_store/common/widgets/layouts/headers/header.dart';
import 'package:admin_t_store/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: TSizebar()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // Header
                THeader(),
                // Body
                Padding(
                  padding: const EdgeInsets.only(
                    left: TSizes.xl,
                    right: TSizes.xl,
                    top: TSizes.xl,
                  ),
                  child: SingleChildScrollView(child: body ?? const SizedBox()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
