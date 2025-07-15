import 'package:admin_t_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_t_store/features/shop/controllers/banner/banner_controller.dart';
import 'package:admin_t_store/features/shop/screens/banners/all_banners/tablets/data_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BannerTablets extends StatelessWidget {
  const BannerTablets({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = BannerController.instance;
    return Obx(() {
      Text(controller.filteredItems.length.toString());
      Text(controller.selectedRows.length.toString());
      return TPaginateDataTable(
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        minWith: 700,
        tableHeight: 900,
        dataRowHeight: 110,
        source: BannersForm(),
        columns: [
          const DataColumn2(label: SelectableText('Banner')),
          DataColumn2(
            label: const Text('Redirect Screen'),
            onSort: (columnIndex, ascending) =>
                controller.sortByParentRout(columnIndex, ascending),
          ),
          const DataColumn2(label: Text('Active')),
          const DataColumn2(label: Text('Action'), fixedWidth: 100),
        ],
      );
    });
  }
}
