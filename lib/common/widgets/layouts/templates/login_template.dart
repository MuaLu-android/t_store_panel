import 'package:admin_t_store/common/styles/spacing_style.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TLoginTemplate extends StatelessWidget {
  const TLoginTemplate({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    // implement build
    final dark = THelperFunctions.isDarkMode(context);
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              color: dark ? TColors.black : TColors.white,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
