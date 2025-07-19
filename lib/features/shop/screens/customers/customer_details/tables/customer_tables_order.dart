import 'package:admin_hmoob_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_hmoob_store/features/shop/controllers/customer/customer_details_controller.dart';
import 'package:admin_hmoob_store/features/shop/screens/customers/customer_details/tables/customer_data_table_source.dart';
import 'package:admin_hmoob_store/utils/devices/device_utility.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerOrderTablets extends StatelessWidget {
  const CustomerOrderTablets({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = CustomerDetailController.instance;
    return Obx(() {
      Visibility(
        visible: false,
        child: Text(controller.filteredCustomerOrders.length.toString()),
      );
      Visibility(
        visible: false,
        child: Text(controller.selectedRows.length.toString()),
      );
      return TPaginateDataTable(
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        minWith: 550,
        tableHeight: 640,
        dataRowHeight: kMinInteractiveDimension,
        columns: [
          DataColumn2(
            label: Text('Order Id'),
            onSort: (columnIndex, ascending) =>
                controller.sortById(columnIndex, ascending),
          ),
          const DataColumn2(label: Text('Date')),
          const DataColumn2(label: Text('Items')),
          DataColumn2(
            label: Text('Status'),
            fixedWidth: TDeviceUtils.isMobileScreen(context) ? 100 : null,
          ),
          const DataColumn2(label: Text('Amount'), numeric: true),
        ],
        source: CustomerDataTableSource(),
      );
    });
  }
}
