// Coupon Offer Model
class CouponOfferModel {
  final String id;
  final String title;
  final String description;
  final String discountType; // 'percentage' or 'fixed'
  final double discountValue;
  final double minOrderAmount;
  final double maxDiscountAmount;
  final DateTime validUntil;
  final String category;
  final List<String> termsAndConditions;
  final bool isActive;

  CouponOfferModel({
    required this.id,
    required this.title,
    required this.description,
    required this.discountType,
    required this.discountValue,
    required this.minOrderAmount,
    required this.maxDiscountAmount,
    required this.validUntil,
    required this.category,
    required this.termsAndConditions,
    required this.isActive,
  });
}