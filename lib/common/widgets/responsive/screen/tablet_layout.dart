import 'package:admin_t_store/common/widgets/layouts/headers/header.dart';
import 'package:admin_t_store/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});
  final Widget? body;
  final GlobalKey<ScaffoldState> scalloldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scalloldKey,
      drawer: const TSizebar(),
      appBar: THeader(scaffoldKey: scalloldKey),
      body: Padding(
        padding: const EdgeInsets.only(
          left: TSizes.xl,
          right: TSizes.xl,
          top: TSizes.xl,
        ),
        child: SingleChildScrollView(child: body ?? const SizedBox()),
      ),
    );
  }
}
