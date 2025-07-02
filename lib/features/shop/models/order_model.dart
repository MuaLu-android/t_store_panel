import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String id;
  OrderStatus status;
  double totalAmount;
  DateTime? orderDate;
  DateTime? deliveryDate;

  // Khoi tao cho OrderModel
  OrderModel({
    required this.id,
    required this.status,
    required this.totalAmount,
    this.orderDate,
    this.deliveryDate,
  });
  // Ham tinh de taoj mot OrderModel trong
  static OrderModel empty() {
    return OrderModel(id: '', status: OrderStatus.processing, totalAmount: 0);
  }

  // Chuyen OrderModel ve dang Json de luu trong Firebase
  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'TotalAmount': totalAmount,
      'OrderDate': orderDate,
      'delyceriDate': deliveryDate,
    };
  }

  // Phuong phap Factory de tao OrderModel tu tai lieu snapshot Friebase
  factory OrderModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return OrderModel(
        id: document.id,
        status: OrderStatus.processing,
        totalAmount: 3,
      );
    } else {
      return OrderModel.empty();
    }
  }
}
