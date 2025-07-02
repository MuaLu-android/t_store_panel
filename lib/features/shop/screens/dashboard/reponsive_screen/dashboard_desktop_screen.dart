import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:admin_t_store/features/shop/screens/dashboard/widgets/week_sales.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.marginWeb),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heding
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Cards
              Row(
                children: [
                  Expanded(
                    child: TDashbosrCard(
                      stas: 25,
                      title: 'Sales total',
                      subtitle: '\$365.6',
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashbosrCard(
                      stas: 15,
                      title: 'Average Order Value',
                      subtitle: '\$25',
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashbosrCard(
                      stas: 45,
                      title: 'Total Oiders',
                      subtitle: '36',
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashbosrCard(
                      stas: 2,
                      title: 'Visitors',
                      subtitle: '\$365.6',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Graphs
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        /// Bar Graph
                        TWeeklySalesGraph(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        /// Orders
                        TRoundedContainer(),
                      ],
                    ),
                  ),

                  /// Pie Chart
                  Expanded(child: TRoundedContainer()),
                ],
              ),
              // Search
              // TextFormField(
              //   controller: controller.searchTextController,
              //   onChanged: (query) => controller.searchQuery(query),
              //   decoration: const InputDecoration(
              //     hintText: 'Search',
              //     prefixIcon: Icon(Iconsax.search_normal),
              //   ),
              // ),
              // const SizedBox(height: TSizes.spaceBtwSections),

              // /// Data Table2
              // Obx(() {
              //   // Order and selected Rows are hidden => fust to update the ui => Obx => ProductRows
              //   Visibility(
              //     visible: false,
              //     child: Text(controller.filtereddataList.length.toString()),
              //   );
              //   return TPaginateDataTable(
              //     dataRowHeight: 56,
              //     // Sorting
              //     sortAscending: controller.sortAscending.value,
              //     sortColumnIndex: controller.sortColumnIndex.value,
              //     columns: [
              //       DataColumn(label: Text('Colunm 1')),
              //       DataColumn(
              //         label: Text('Colunm 2'),
              //         onSort: (columnIndex, ascending) =>
              //             controller.sortById(columnIndex, ascending),
              //       ),
              //       DataColumn(label: Text('Colunm 3')),
              //       DataColumn(
              //         label: Text('Colunm 4'),
              //         onSort: (columnIndex, ascending) =>
              //             controller.sortById(columnIndex, ascending),
              //       ),
              //     ],
              //     source: MyData(),
              //   );
              // }),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyData extends DataTableSource {
//   final controller = Get.put(DashboardController());
//   @override
//   DataRow? getRow(int index) {
//     final data = controller.filtereddataList[index];
//     return DataRow2(
//       onTap: () {},
//       selected: controller.selectedRows[index],
//       onSelectChanged: (value) =>
//           controller.selectedRows[index] = value ?? false,
//       cells: [
//         DataCell(Text(data['column1'] ?? '')),
//         DataCell(Text(data['column2'] ?? '')),
//         DataCell(Text(data['column3'] ?? '')),
//         DataCell(Text(data['column4'] ?? '')),
//       ],
//     );
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => controller.filtereddataList.length;

//   @override
//   int get selectedRowCount => 0;
// }

// class DashboardController extends GetxController {
//   static DashboardController get instance => Get.find();
//   var filtereddataList = <Map<String, String>>[].obs;
//   var dataList = <Map<String, String>>[].obs;
//   RxList<bool> selectedRows = <bool>[].obs;
//   RxInt sortColumnIndex =
//       1.obs; // Observable for traking the index of the column for sorting
//   RxBool sortAscending = true
//       .obs; // Observer for tracking the sorting order (ascending or descending)
//   final searchTextController = TextEditingController();
//   @override
//   void onInit() {
//     super.onInit();
//     fetchDummyData();
//     filtereddataList.assignAll(dataList);
//   }

//   void sortById(int sortColumIndex, bool ascending) {
//     sortAscending.value = ascending;
//     filtereddataList.sort((a, b) {
//       if (ascending) {
//         return filtereddataList[0]['column1']
//             .toString()
//             .toLowerCase()
//             .compareTo(filtereddataList[0]['column1'].toString().toLowerCase());
//       } else {
//         return filtereddataList[0]['column1']
//             .toString()
//             .toLowerCase()
//             .compareTo(filtereddataList[0]['column1'].toString().toLowerCase());
//       }
//     });
//     sortColumnIndex.value = sortColumIndex;
//   }

//   // search
//   void searchQuery(String query) {
//     filtereddataList.assignAll(
//       dataList.where(
//         (item) => item['column1']!.trim().contains(query.toLowerCase().trim()),
//       ),
//     );
//   }

//   void fetchDummyData() {
//     selectedRows.assignAll(List.generate(36, (inedx) => false));
//     dataList.addAll(
//       List.generate(
//         36,
//         (index) => {
//           'column1': 'Data ${index + 1}-1',
//           'column2': 'Data ${index + 1}-2',
//           'column3': 'Data ${index + 1}-3',
//           'column4': 'Data ${index + 1}-4',
//         },
//       ),
//     );
//   }
// }
