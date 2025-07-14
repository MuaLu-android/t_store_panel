import 'package:admin_t_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_t_store/features/shop/controllers/products/products_controller.dart';
import 'package:admin_t_store/features/shop/screens/products/all_products/tablets/product_datasource.dart';
import 'package:admin_t_store/utils/devices/device_utility.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TabletProductsScreen extends StatelessWidget {
  const TabletProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = ProductController.instace;
    return Obx(() {
      Visibility(
        visible: false,
        child: Text(controller.fillteredItems.length.toString()),
      );
      Visibility(
        visible: false,
        child: Text(controller.selectedRows.length.toString()),
      );
      return TPaginateDataTable(
        minWith: 1000,
        columns: [
          DataColumn2(
            label: const Text('Products'),
            fixedWidth: !TDeviceUtils.isDesktopScreen(context) ? 300 : 400,
            onSort: (columnIndex, ascending) =>
                controller.sortByName(columnIndex, ascending),
          ),
          DataColumn2(
            label: Text('Stock'),
            onSort: (columnIndex, ascending) =>
                controller.sortByTock(columnIndex, ascending),
          ),
          DataColumn2(
            label: Text('Sold'),
            onSort: (columnIndex, ascending) =>
                controller.sortBySoldItem(columnIndex, ascending),
          ),
          const DataColumn2(label: Text('Brands')),
          DataColumn2(
            label: Text('Price'),
            onSort: (columnIndex, ascending) =>
                controller.sortByPrice(columnIndex, ascending),
          ),
          const DataColumn2(label: Text('Date')),
          const DataColumn2(label: Text('Action'), fixedWidth: 100),
        ],
        source: ProductDatasource(),
      );
    });
  }
}
