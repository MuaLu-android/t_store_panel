import 'package:admin_t_store/features/shop/models/order_model.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();
  final RxList<double> weeklySales = <double>[].obs;

  // Order
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      totalAmount: 265,
      orderDate: DateTime(2025, 7, 2),
      deliveryDate: DateTime(2025, 7, 2),
    ),
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      totalAmount: 369,
      orderDate: DateTime(2025, 7, 2),
      deliveryDate: DateTime(2025, 7, 2),
    ),
    OrderModel(
      id: 'CWT0046',
      status: OrderStatus.delivered,
      totalAmount: 365,
      orderDate: DateTime(2025, 7, 1),
      deliveryDate: DateTime(2025, 7, 1),
    ),
    OrderModel(
      id: 'CWT0014',
      status: OrderStatus.delivered,
      totalAmount: 345,
      orderDate: DateTime(2025, 6, 30),
      deliveryDate: DateTime(2025, 6, 30),
    ),
    OrderModel(
      id: 'CWT0017',
      status: OrderStatus.delivered,
      totalAmount: 265,
      orderDate: DateTime(2025, 6, 30),
      deliveryDate: DateTime(2025, 6, 30),
    ),
  ];
  @override
  void onInit() {
    _calulateWeeklySales();
    super.onInit();
  }

  // Tinh doanh so hang tuan
  void _calulateWeeklySales() {
    // Reset weeklySales to zeros
    weeklySales.value = List<double>.filled(7, 0.0);
    for (var order in orders) {
      final DateTime orderWeekStart = THelperFunctions.getStartOfWeek(
        order.orderDate!,
      );
      // Check if the order is within the current week
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate!.weekday - 1) % 7;
        // Ensure the index is non-negative
        index = index < 0 ? index + 7 : index;
        weeklySales[index] += order.totalAmount;
      }
    }
  }
}
