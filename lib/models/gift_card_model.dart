// Gift Card Model
class GiftCard {
  final String id;
  final String brand;
  final double value;
  final String description;
  final String image;
  final int validityDays;
  final String category;
  final bool isActive;
  final DateTime purchaseDate;
  final DateTime expiryDate;
  final String? code;
  final double? balance;
  final String? recipientName;
  final String? recipientEmail;

  GiftCard({
    required this.id,
    required this.brand,
    required this.value,
    required this.description,
    required this.image,
    required this.validityDays,
    required this.category,
    required this.isActive,
    required this.purchaseDate,
    required this.expiryDate,
    this.code,
    this.balance,
    this.recipientName,
    this.recipientEmail,
  });
}