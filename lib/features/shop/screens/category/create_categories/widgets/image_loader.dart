import 'dart:typed_data';

import 'package:admin_t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:admin_t_store/common/widgets/images/t_circular_image.dart';
import 'package:admin_t_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TImageUpLoader extends StatelessWidget {
  const TImageUpLoader({
    super.key,
    this.cricular = false,
    this.image,
    required this.imageType,
    this.width = 100,
    this.height = 100,
    this.memoryImage,
    this.icon = Iconsax.edit,
    this.top,
    this.bottom = 0,
    this.right,
    this.left = 0,
    this.onIconButtonPressed,
  });

  final bool cricular;
  final String? image;
  final ImageType imageType;
  final double width;
  final double height;
  final Uint8List? memoryImage;
  final IconData icon;
  final double? top, bottom, right, left;
  final void Function()? onIconButtonPressed;
  @override
  Widget build(BuildContext context) {
    // implement build
    return Stack(
      children: [
        // Display the image in either cricular or rounded shpe
        cricular
            ? TCircularImage(
                image: image,
                width: width,
                height: height,
                memoryIamge: memoryImage,
                backgroundColor: TColors.primaryBackground,
                imageType: imageType,
              )
            : TRoundedImage(
                imageUrl: image,
                width: width,
                height: height,
                imageType: imageType,
                memoryImage: memoryImage,
                backgroundColor: TColors.primaryBackground,
              ),
        // Display the edit icon button on top of the image
        Positioned(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
          child: TCircularIcon(
            icon: icon,
            size: TSizes.md,
            color: Colors.white,
            onPressed: onIconButtonPressed,
            backgroundColor: TColors.primary.withAlpha(245),
          ),
        ),
      ],
    );
  }
}
