import 'package:admin_t_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_t_store/features/shop/screens/banners/data/banner_model.dart';
import 'package:admin_t_store/features/shop/screens/category/all_categories/widgets/tablet_action_button.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class BannersForm extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        const DataCell(
          TRoundedImage(
            width: 180,
            height: 100,
            padding: TSizes.sm,
            imageUrl: TImages.banner1,
            imageType: ImageType.asset,
            backgroundColor: TColors.primaryBackground,
            borderRadius: TSizes.borderRadiusMd,
          ),
        ),
        const DataCell(Text('Shop')),
        const DataCell(Icon(Iconsax.eye, color: TColors.primary)),
        DataCell(
          TTabletActionButtons(
            onEditPressed: () => Get.toNamed(
              TRoutes.editBanner,
              arguments: BannerModel(
                imageUrl: '',
                targetScreen: '',
                active: false,
              ),
            ),
            onDeletePressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;
}
