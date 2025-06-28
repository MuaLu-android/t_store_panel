import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: Drawer()),
          Expanded(
            child: TRoundedContainer(
              width: double.infinity,
              height: 500,
              backgroundColor: Colors.blue.withAlpha(100),
            ),
          ),
        ],
      ),
    );
  }
}
