import 'package:admin_t_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_t_store/features/shop/screens/customers/customer_details/tables/customer_data_table_source.dart';
import 'package:admin_t_store/utils/devices/device_utility.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CustomerOrderTablets extends StatelessWidget {
  const CustomerOrderTablets({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TPaginateDataTable(
      minWith: 550,
      tableHeight: 640,
      dataRowHeight: kMinInteractiveDimension,
      columns: [
        const DataColumn2(label: Text('Order Id')),
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
  }
}
