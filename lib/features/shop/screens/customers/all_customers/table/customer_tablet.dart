import 'package:admin_t_store/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin_t_store/features/shop/screens/customers/all_customers/table/customer_data_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CustomerTablet extends StatelessWidget {
  const CustomerTablet({super.key});

  @override
  Widget build(BuildContext context) {
    //implement build
    return TPaginateDataTable(
      minWith: 700,
      columns: const [
        DataColumn2(label: Text('Customer')),
        DataColumn2(label: Text('Email')),
        DataColumn2(label: Text('Phone Number')),
        DataColumn2(label: Text('Registered')),
        DataColumn2(label: Text('Action'), fixedWidth: 100),
      ],
      source: CustomerDataSource(),
    );
  }
}
