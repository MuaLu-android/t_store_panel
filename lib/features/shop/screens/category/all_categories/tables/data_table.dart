import 'package:admin_t_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_t_store/features/shop/controllers/categories/category_controller.dart';
import 'package:admin_t_store/features/shop/screens/category/all_categories/tables/table_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class TCategoryTablets extends StatelessWidget {
  const TCategoryTablets({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = CategoryController.instance;
    return Obx(() {
      Text(controller.filteredItems.length.toString());
      Text(controller.selectedRow.length.toString());
      return TPaginateDataTable(
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        minWith: 700,
        source: CategoryRows(),
        columns: [
          DataColumn2(
            label: const Text('Category'),
            onSort: (columnIndex, ascending) =>
                controller.sortByName(columnIndex, ascending),
          ),
          DataColumn2(
            label: const Text('Parent Category'),
            onSort: (columnIndex, ascending) =>
                controller.sortByParentName(columnIndex, ascending),
          ),
          const DataColumn2(label: Text('Featured')),
          const DataColumn2(label: Text('Date')),
          const DataColumn2(label: Text('Action'), fixedWidth: 100),
        ],
      );
    });
  }
}
