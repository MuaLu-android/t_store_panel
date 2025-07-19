import 'package:admin_hmoob_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_hmoob_store/features/shop/controllers/banner/banner_controller.dart';
import 'package:admin_hmoob_store/features/shop/screens/category/all_categories/widgets/tablet_action_button.dart';
import 'package:admin_hmoob_store/route/route.dart';
import 'package:admin_hmoob_store/utils/constants/colors.dart';
import 'package:admin_hmoob_store/utils/constants/enums.dart';
import 'package:admin_hmoob_store/utils/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class BannersForm extends DataTableSource {
  final controller = BannerController.instance;
  @override
  DataRow? getRow(int index) {
    final banner = controller.filteredItems[index];
    return DataRow2(
      selected: controller.selectedRows[index],
      onTap: () => Get.toNamed(TRoutes.editBanner, arguments: banner),
      onSelectChanged: (value) =>
          controller.selectedRows[index] = value ?? false,
      cells: [
        DataCell(
          TRoundedImage(
            width: 180,
            height: 100,
            padding: TSizes.sm,
            imageUrl: banner.image,
            imageType: ImageType.network,
            backgroundColor: TColors.primaryBackground,
            borderRadius: TSizes.borderRadiusMd,
          ),
        ),
        DataCell(Text(controller.fromatRoute(banner.targetScreen))),
        DataCell(
          banner.active
              ? Icon(Iconsax.eye, color: TColors.primary)
              : Icon(Iconsax.eye_slash),
        ),
        DataCell(
          TTabletActionButtons(
            onEditPressed: () =>
                Get.toNamed(TRoutes.editBanner, arguments: banner),
            onDeletePressed: () => controller.confirmAndDeleteItem(banner),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredItems.length;

  @override
  int get selectedRowCount => 0;
}
