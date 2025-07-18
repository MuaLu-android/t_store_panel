import 'package:admin_t_store/common/widgets/images/t_circular_image.dart';
import 'package:admin_t_store/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:admin_t_store/features/shop/controllers/settings/setting_controller.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../route/route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSizebar extends StatelessWidget {
  const TSizebar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SettingsController.instance;
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
              Row(
                children: [
                  Obx(
                    () => TCircularImage(
                      imageType: controller.settings.value.appLogo.isNotEmpty
                          ? ImageType.network
                          : ImageType.asset,
                      image: controller.settings.value.appLogo.isNotEmpty
                          ? controller.settings.value.appLogo
                          : TImages.darkAppLogo,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Text(
                        controller.settings.value.appName,
                        style: Theme.of(context).textTheme.headlineLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
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
                      route: TRoutes.dashboard,
                      icon: Iconsax.status,
                      itemName: 'Dashboard',
                    ),
                    const TMenuTem(
                      route: TRoutes.media,
                      icon: Iconsax.image,
                      itemName: 'Media',
                    ),
                    const TMenuTem(
                      route: TRoutes.categories,
                      icon: Iconsax.category,
                      itemName: 'Categories',
                    ),
                    const TMenuTem(
                      route: TRoutes.products,
                      icon: Iconsax.shopping_bag,
                      itemName: 'Products',
                    ),
                    const TMenuTem(
                      route: TRoutes.customers,
                      icon: Iconsax.profile_2user,
                      itemName: 'Customers',
                    ),
                    const TMenuTem(
                      route: TRoutes.banners,
                      icon: Iconsax.picture_frame,
                      itemName: 'Banners',
                    ),
                    const TMenuTem(
                      route: TRoutes.orders,
                      icon: Iconsax.box,
                      itemName: 'Orders',
                    ),
                    const TMenuTem(
                      route: TRoutes.brands,
                      icon: Iconsax.dcube,
                      itemName: 'Brands',
                    ),
                    // Other Menu Items
                    Text(
                      'OTHER',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2),
                    ),
                    const TMenuTem(
                      route: TRoutes.profile,
                      icon: Iconsax.user,
                      itemName: 'Profile',
                    ),
                    const TMenuTem(
                      route: TRoutes.settings,
                      icon: Iconsax.setting_2,
                      itemName: 'Settings',
                    ),
                    const TMenuTem(
                      route: 'logout',
                      icon: Iconsax.logout,
                      itemName: 'Logout',
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
