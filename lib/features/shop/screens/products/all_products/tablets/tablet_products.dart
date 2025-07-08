import 'package:admin_t_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_t_store/features/shop/screens/products/all_products/tablets/product_datasource.dart';
import 'package:admin_t_store/utils/devices/device_utility.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TabletProductsScreen extends StatelessWidget {
  const TabletProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TPaginateDataTable(
      minWith: 1000,
      columns: [
        DataColumn2(
          label: const Text('Products'),
          fixedWidth: !TDeviceUtils.isDesktopScreen(context) ? 300 : 400,
        ),
        const DataColumn2(label: Text('Stock')),
        const DataColumn2(label: Text('Brand')),
        const DataColumn2(label: Text('Price')),
        const DataColumn2(label: Text('Date')),
        const DataColumn2(label: Text('Action'), fixedWidth: 100),
      ],
      source: ProductDatasource(),
    );
  }
}
