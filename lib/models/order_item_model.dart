// Order Model
import 'package:ecoshop/models/product_model.dart';

class OrderItem {
  final String id;
  final String status;
  final DateTime orderDate;
  final DateTime? deliveryDate;
  final double totalAmount;
  final List<ProductModel> items;
  final String? trackingNumber;

  OrderItem({
    required this.id,
    required this.status,
    required this.orderDate,
    this.deliveryDate,
    required this.totalAmount,
    required this.items,
    this.trackingNumber,
  });
}