import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/controllers/dashboard_controller.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/devices/device_utility.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TWeeklySalesGraph extends StatelessWidget {
  const TWeeklySalesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = Get.put(DashboardController());
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Sales',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          // Graph
          SizedBox(
            height: 400,
            // Bieu do thanh
            child: BarChart(
              // Bieu do du lieu
              BarChartData(
                titlesData: buildFlTitlesData(),
                borderData: FlBorderData(
                  show: true,
                  border: Border(top: BorderSide.none, right: BorderSide.none),
                ),
                gridData: const FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  horizontalInterval: 200,
                ),
                /*
                                    Nhom thanh hien thi du lieu. Dung asMap de anh xa, entries de lay mot muc
                                    nhap rieng le tai thoi diem. 
                                    */
                barGroups: controller.weeklySales
                    .asMap()
                    .entries
                    .map(
                      // nhap muc cho moi thanh du lieu
                      (entry) => BarChartGroupData(
                        x: entry.key,
                        barRods: [
                          BarChartRodData(
                            width: 30,
                            toY: entry.value,
                            color: TColors.primary,
                            borderRadius: BorderRadius.circular(TSizes.sm),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                // Khoang cach du cac thanh
                groupsSpace: TSizes.spaceBtwItems,
                // Co the tuong tac voi du lieu va hien thi
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => TColors.secondary,
                  ),
                  touchCallback: TDeviceUtils.isDesktopSreen(context)
                      ? (barTouchEvent, barTouchResponse) {}
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FlTitlesData buildFlTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          // Hien thi thanh tieu de
          getTitlesWidget: (value, meta) {
            // Map index to the desired dat of the week
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
            // Calulate the index and ensure it wraps around for the correct day
            final index = value.toInt() % days.length;
            // Get the day corresponding to the calculated index
            final day = days[index];
            return SideTitleWidget(space: 0, meta: meta, child: Text(day));
          },
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 200,
          reservedSize: 50,
        ),
      ),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}
