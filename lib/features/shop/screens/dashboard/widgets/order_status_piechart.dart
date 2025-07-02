import 'package:admin_t_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/controllers/dashboard_controller.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/helpers/helper_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderStatusPiechart extends StatelessWidget {
  const OrderStatusPiechart({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    /* quan ly singleton là cách tổ chức controller/service theo singleton, 
    nhưng sử dụng GetX để truy cập dễ dàng và tự động thay vì tự viết quản lý thủ công.*/
    final controller = DashboardController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Status',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          // Graph
          SizedBox(
            height: 400,
            child: PieChart(
              // Bieu do du lieu trang thai hinh tron
              PieChartData(
                sections: controller.orderStatusData.entries.map((entry) {
                  final status = entry.key;
                  final count = entry.value;
                  return PieChartSectionData(
                    title: count.toString(),
                    value: count.toDouble(),
                    radius: 100,
                    color: THelperFunctions.getOrderStatusColor(status),
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }).toList(), // chuyển Map.entries thanh mot List
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                  enabled: true,
                ),
              ),
            ),
          ),
          // Show status and Color Meta
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Orders')),
                DataColumn(label: Text('Total')),
              ],
              rows: controller.orderStatusData.entries.map((entry) {
                final status = entry.key;
                final count = entry.value;
                final totalAmount = controller.totalAmounts[status] ?? 0;
                return DataRow(
                  cells: [
                    DataCell(
                      Row(
                        children: [
                          TCircularContainer(
                            width: 20,
                            height: 20,
                            backgroundColor:
                                THelperFunctions.getOrderStatusColor(status),
                          ),
                          Expanded(
                            child: Text(
                              ' ${controller.getDisplayStatusName(status)}',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataCell(Text(' $count')),
                    DataCell(
                      Text(
                        ' \$${totalAmount.toStringAsFixed(2)}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
