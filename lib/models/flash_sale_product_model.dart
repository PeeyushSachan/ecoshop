
// Flash Sale Product Model
import 'package:ecoshop/models/product_model.dart';

class FlashSaleProduct {
  final ProductModel product;
  final DateTime flashSaleEndTime;
  final int originalStock;
  final int soldCount;
  final double flashSalePrice;

  FlashSaleProduct({
    required this.product,
    required this.flashSaleEndTime,
    required this.originalStock,
    required this.soldCount,
    required this.flashSalePrice,
  });

  Duration get timeLeft {
    final now = DateTime.now();
    if (flashSaleEndTime.isAfter(now)) {
      return flashSaleEndTime.difference(now);
    }
    return Duration.zero;
  }

  int get remainingStock => originalStock - soldCount;
  
  double get soldPercentage => (soldCount / originalStock) * 100;
  
  double get stockPercentage => (remainingStock / originalStock) * 100;
  
  double get discountPercentage => ((product.mrp - flashSalePrice) / product.mrp) * 100;
  
  bool get isExpired => DateTime.now().isAfter(flashSaleEndTime);
  
  bool get isAlmostSoldOut => stockPercentage < 10;
}