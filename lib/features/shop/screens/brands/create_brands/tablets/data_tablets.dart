import 'package:admin_t_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_t_store/features/shop/screens/brands/create_brands/tablets/data_source.dart';
import 'package:admin_t_store/utils/devices/device_utility.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class BrandTable extends StatelessWidget {
  const BrandTable({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TPaginateDataTable(
      minWith: 700,
      tableHeight: 760,
      dataRowHeight: 64,
      source: BrandsRows(),
      columns: [
        DataColumn2(
          label: Text('Brand'),
          fixedWidth: TDeviceUtils.isMobileScreen(Get.context!) ? null : 200,
        ),
        DataColumn2(label: Text('Categories')),
        DataColumn2(
          label: const Text('Featured'),
          fixedWidth: TDeviceUtils.isMobileScreen(Get.context!) ? null : 100,
        ),
        DataColumn2(
          label: const Text('Date'),
          fixedWidth: TDeviceUtils.isMobileScreen(Get.context!) ? null : 200,
        ),
        DataColumn2(
          label: const Text('Action'),
          fixedWidth: TDeviceUtils.isMobileScreen(Get.context!) ? null : 100,
        ),
      ],
    );
  }
}
