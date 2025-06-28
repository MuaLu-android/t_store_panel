import 'package:admin_t_store/common/widgets/images/t_circular_image.dart';
import 'package:admin_t_store/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import '../../../../../route/route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSizebar extends StatelessWidget {
  const TSizebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: TColors.white,
          border: Border(right: BorderSide(color: TColors.grey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TCircularImage(
                imageType: ImageType.assets,
                image: TImages.darkAppLogo,
                width: 100,
                height: 100,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Menu',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2),
                    ),
                    // menu Items
                    const TMenuTem(
                      route: TRoutes.firstScreen,
                      icon: Iconsax.status,
                      itemName: 'Dashboard',
                    ),
                    const TMenuTem(
                      route: TRoutes.secondScreen,
                      icon: Iconsax.image,
                      itemName: 'Media',
                    ),
                    const TMenuTem(
                      route: TRoutes.reponsiveDesignTutoralScreen,
                      icon: Iconsax.picture_frame,
                      itemName: 'Banners',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
