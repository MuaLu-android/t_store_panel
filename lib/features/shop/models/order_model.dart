import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/helpers/helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String userId;
  final String docId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final DateTime? deliveryDate;

  // Khoi tao cho OrderModel
  OrderModel({
    required this.id,
    this.userId = '',
    this.docId = '',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.deliveryDate,
  });
  // Phuong thuc lay ngay dat hang
  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);
  // Phuong thuc lay ngay giao hnag
  String get formattedDeliveryDate =>
      deliveryDate != null ? THelperFunctions.getFormattedDate(orderDate) : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
      ? 'Shipment on the way'
      : 'Processing';

  // Ham tinh de taoj mot OrderModel trong
  static OrderModel empty() {
    return OrderModel(
      id: '',
      status: OrderStatus.processing,
      totalAmount: 0,
      orderDate: DateTime.now(),
    );
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
        orderDate: DateTime.now(),
      );
    } else {
      return OrderModel.empty();
    }
  }
}
