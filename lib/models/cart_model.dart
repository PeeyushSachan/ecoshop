import 'package:ecoshop/models/product_model.dart';

class CartModelData {
  final ProductModel product;
  int quantity;
  final Map<String, String> selectedVariants;

  CartModelData({
    required this.product,
    required this.quantity,
    required this.selectedVariants,
  });
}