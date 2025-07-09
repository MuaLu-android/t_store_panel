import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:admin_t_store/features/shop/screens/category/all_categories/widgets/tablet_action_button.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/helpers/helper_functions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDataTableSource extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final orders = DashboardController.orders[index];
    return DataRow2(
      onTap: () => Get.toNamed(TRoutes.detailsOrders, arguments: orders),
      selected: false,
      onSelectChanged: (value) {},
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
        DataCell(
          TTabletActionButtons(
            view: true,
            edit: false,
            onViewPressed: () =>
                Get.toNamed(TRoutes.detailsOrders, arguments: orders),
            onDeletePressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => DashboardController.orders.length;

  @override
  int get selectedRowCount => 0;
}
