// Payment Method Model
class PaymentMethodModel {
  final String id;
  final String type; // 'card', 'upi', 'wallet'
  final String? cardNumber;
  final String? holderName;
  final String? expiryDate;
  final String? cardType;
  final String? upiId;
  final String? walletName;
  final double? balance;
  bool isDefault;

  PaymentMethodModel({
    required this.id,
    required this.type,
    this.cardNumber,
    this.holderName,
    this.expiryDate,
    this.cardType,
    this.upiId,
    this.walletName,
    this.balance,
    required this.isDefault,
  });
}