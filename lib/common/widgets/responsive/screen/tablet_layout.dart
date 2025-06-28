import 'package:admin_t_store/common/widgets/layouts/headers/header.dart';
import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});
  final Widget? body;
  final GlobalKey<ScaffoldState> scalloldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scalloldKey,
      drawer: const Drawer(),
      appBar: THeader(scaffoldKey: scalloldKey),
      body: body ?? const SizedBox(),
    );
  }
}
