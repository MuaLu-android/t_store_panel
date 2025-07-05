import 'package:admin_t_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_t_store/features/shop/screens/category/all_categories/tables/table_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TCategoryTablets extends StatelessWidget {
  const TCategoryTablets({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TPaginateDataTable(
      minWith: 700,
      source: CategoryRows(),
      columns: const [
        DataColumn2(label: Text('Category')),
        DataColumn2(label: Text('Parent Category')),
        DataColumn2(label: Text('Featured')),
        DataColumn2(label: Text('Date')),
        DataColumn2(label: Text('Action'), fixedWidth: 100),
      ],
    );
  }
}
