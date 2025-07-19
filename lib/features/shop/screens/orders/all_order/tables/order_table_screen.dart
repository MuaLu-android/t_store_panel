import 'package:admin_hmoob_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_hmoob_store/features/shop/controllers/order/oder_controller.dart';
import 'package:admin_hmoob_store/features/shop/screens/orders/all_order/tables/order_data_table_source.dart';
import 'package:admin_hmoob_store/utils/devices/device_utility.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class OrderTableScreen extends StatelessWidget {
  const OrderTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = OrderController.instance;
    return Obx(() {
      Text(controller.filteredItems.length.toString());
      Text(controller.selectedRows.length.toString());
      return TPaginateDataTable(
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        minWith: 700,
        columns: [
          const DataColumn2(label: Text('Order ID')),
          DataColumn2(
            label: Text('Date'),
            onSort: (columnIndex, ascending) =>
                controller.sortByDate(columnIndex, ascending),
          ),
          const DataColumn2(label: Text('Items')),
          DataColumn2(
            label: Text('Status'),
            fixedWidth: TDeviceUtils.isMobileScreen(context) ? 120 : null,
          ),
          DataColumn2(
            label: Text('Amount'),
            onSort: (columnIndex, ascending) =>
                controller.sortById(columnIndex, ascending),
          ),
          const DataColumn2(label: Text('Action'), fixedWidth: 100),
        ],
        source: OrderRows(),
      );
    });
  }
}
