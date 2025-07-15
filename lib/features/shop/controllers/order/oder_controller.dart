import 'package:admin_t_store/data/abstract/base_data_table_controller.dart';
import 'package:admin_t_store/data/repositories/orders/order_repository.dart';
import 'package:admin_t_store/features/shop/models/order_model.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class OrderController extends TBaseController<OrderModel> {
  static OrderController get instance => Get.find();

  RxBool statusLoader = false.obs;
  var orderStatus = OrderStatus.delivered.obs;
  final _orderRepository = Get.put(OrderRepository());

  @override
  Future<List<OrderModel>> fetchItems() async {
    sortAscending.value = false;
    return await _orderRepository.getAllOrders();
  }

  @override
  bool containsSearchQuery(OrderModel item, String query) {
    return item.id.toLowerCase().contains(query.toLowerCase());
  }

  @override
  Future<void> deleteItem(OrderModel item) async {
    await _orderRepository.deleteOrder(item.docId);
  }

  void sortById(int sortColumnIndex, bool ascending) {
    sortByProperty(
      sortColumnIndex,
      ascending,
      (OrderModel o) => o.totalAmount.toString().toLowerCase(),
    );
  }

  void sortByDate(int sortColumnIndex, bool ascending) {
    sortByProperty(
      sortColumnIndex,
      ascending,
      (OrderModel o) => o.orderDate.toString().toLowerCase(),
    );
  }

  /// Update Product Status
  Future<void> updateOrderStatus(
    OrderModel order,
    OrderStatus newStatus,
  ) async {
    try {
      statusLoader.value = true;
      order.status = newStatus;
      await _orderRepository.updateOrderSpecificValue(order.docId, {
        'status': newStatus.toString(),
      });
      updateItemFormList(order);
      orderStatus.value = newStatus;
      TLoaders.successSnackBar(
        title: 'Updated',
        message: 'Order Status Updated',
      );
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      statusLoader.value = false;
    }
  }
}
