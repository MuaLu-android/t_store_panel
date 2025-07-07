import 'package:admin_t_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_t_store/features/shop/screens/banners/all_banners/tablets/data_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class BannerTablets extends StatelessWidget {
  const BannerTablets({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TPaginateDataTable(
      minWith: 700,
      tableHeight: 900,
      dataRowHeight: 110,
      source: BannersForm(),
      columns: const [
        DataColumn2(label: SelectableText('Banner')),
        DataColumn2(label: Text('Redirect Screen')),
        DataColumn2(label: Text('Active')),
        DataColumn2(label: Text('Action'), fixedWidth: 100),
      ],
    );
  }
}
