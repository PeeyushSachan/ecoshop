// Order Model
import 'package:ecoshop/models/product/product_model.dart';

class OrderItemModel {
  final String id;
  final String status;
  final DateTime orderDate;
  final DateTime? deliveryDate;
  final double totalAmount;
  final List<ProductModel> items;
  final String? trackingNumber;

  OrderItemModel({
    required this.id,
    required this.status,
    required this.orderDate,
    this.deliveryDate,
    required this.totalAmount,
    required this.items,
    this.trackingNumber,
  });
}