import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:admin_t_store/features/shop/controllers/order/oder_controller.dart';
import 'package:admin_t_store/features/shop/screens/category/all_categories/widgets/tablet_action_button.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/helpers/helper_functions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class OrderDataTableSource extends DataTableSource {
  final controller = OrderController.instance;
  @override
  DataRow? getRow(int index) {
    final orders = controller.filteredItems[index];
    return DataRow2(
      onTap: () => Get.toNamed(
        TRoutes.detailsOrders,
        arguments: orders,
        parameters: {'orderId': orders.id},
      ),
      selected: controller.selectedRows[index],
      onSelectChanged: (value) => controller.selectedRows[index] == value,
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
        DataCell(Text('${orders.items.length} Items')),
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
            onViewPressed: () => Get.toNamed(
              TRoutes.detailsOrders,
              arguments: orders,
              parameters: {'orderId': orders.id},
            ),
            onDeletePressed: () => controller.confirmAndDeleteItem(orders),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.selectedRows.length;

  @override
  int get selectedRowCount =>
      controller.selectedRows.where((item) => item).length;
}
