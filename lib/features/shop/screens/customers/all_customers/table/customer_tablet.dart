import 'package:admin_t_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_t_store/features/shop/controllers/customer/customer_controller.dart';
import 'package:admin_t_store/features/shop/screens/customers/all_customers/table/customer_data_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomerTablet extends StatelessWidget {
  const CustomerTablet({super.key});

  @override
  Widget build(BuildContext context) {
    //implement build
    final controller = CustomerController.instance;
    return Obx(() {
      Text(controller.filteredItems.length.toString());
      Text(controller.selectedRows.length.toString());
      return TPaginateDataTable(
        minWith: 700,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        columns: [
          DataColumn2(
            label: Text('Customer'),
            onSort: (columnIndex, ascending) =>
                controller.sortByName(columnIndex, ascending),
          ),
          const DataColumn2(label: Text('Email')),
          const DataColumn2(label: Text('Phone Number')),
          const DataColumn2(label: Text('Registered')),
          const DataColumn2(label: Text('Action'), fixedWidth: 100),
        ],
        source: CustomerDataSource(),
      );
    });
  }
}
