import 'package:admin_t_store/common/widgets/images/t_rounded_image.dart';
import 'package:admin_t_store/features/shop/screens/category/all_categories/widgets/tablet_action_button.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProductDatasource extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(
          Row(
            children: [
              TRoundedImage(
                width: 50,
                height: 50,
                padding: TSizes.xs,
                imageType: ImageType.asset,
                imageUrl: TImages.nikeLogo,
                borderRadius: TSizes.borderRadiusMd,
                backgroundColor: TColors.primaryBackground,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Flexible(
                child: Text(
                  'Product Title',
                  style: Theme.of(
                    Get.context!,
                  ).textTheme.bodyLarge!.apply(color: TColors.primary),
                ),
              ),
            ],
          ),
        ),
        DataCell(Text('256')),
        DataCell(
          Row(
            children: [
              TRoundedImage(
                width: 35,
                height: 35,
                padding: TSizes.xs,
                imageType: ImageType.asset,
                imageUrl: TImages.nikeLogo,
                borderRadius: TSizes.borderRadiusMd,
                backgroundColor: TColors.primaryBackground,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Flexible(
                child: Text(
                  'Nike',
                  style: Theme.of(
                    Get.context!,
                  ).textTheme.bodyLarge!.apply(color: TColors.primary),
                ),
              ),
            ],
          ),
        ),
        const DataCell(Text('\$99.9')),
        DataCell(Text(DateTime.now().toString())),
        DataCell(
          TTabletActionButtons(
            onEditPressed: () => Get.toNamed(TRoutes.editProduct),
            onDeletePressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
