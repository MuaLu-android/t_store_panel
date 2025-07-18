import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/helpers/helper_functions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';

class OrderRows extends DataTableSource {
  final controller = DashboardController.instance;
  @override
  DataRow? getRow(int index) {
    final orders = controller.filteredItems[index];
    return DataRow2(
      cells: [
        DataCell(
          Text(
            orders.id,
            style: Theme.of(
              Get.context!,
            ).textTheme.bodyLarge!.apply(color: TColors.primary),
          ),
        ),
        DataCell(Text(orders.formattedOrderDate)),
        DataCell(Text('5 Items')),
        DataCell(
          TRoundedContainer(
            radius: TSizes.cardRadiusSm,
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md,
              vertical: TSizes.xs,
            ),
            backgroundColor: THelperFunctions.getOrderStatusColor(
              orders.status,
            ).withAlpha(128),
            child: Text(
              orders.status.name.capitalize.toString(),
              style: TextStyle(
                color: THelperFunctions.getOrderStatusColor(orders.status),
              ),
            ),
          ),
        ),
        DataCell(Text('\$${orders.totalAmount}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  // chieu dai don hang
  int get rowCount => controller.filteredItems.length;

  @override
  int get selectedRowCount =>
      controller.selectedRows.where((item) => item).length;
}
