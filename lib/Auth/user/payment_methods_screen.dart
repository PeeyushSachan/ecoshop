import 'package:ecoshop/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      id: "1",
      type: "card",
      cardNumber: "4532 **** **** 1234",
      holderName: "John Doe",
      expiryDate: "12/26",
      cardType: "Visa",
      isDefault: true,
    ),
    PaymentMethod(
      id: "2",
      type: "card",
      cardNumber: "5678 **** **** 5678",
      holderName: "John Doe",
      expiryDate: "08/25",
      cardType: "Mastercard",
      isDefault: false,
    ),
    PaymentMethod(
      id: "3",
      type: "upi",
      upiId: "john.doe@paytm",
      holderName: "John Doe",
      isDefault: false,
    ),
    PaymentMethod(
      id: "4",
      type: "wallet",
      walletName: "Paytm Wallet",
      balance: 2500.0,
      isDefault: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text(
                      'Payment Methods',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => _showAddPaymentMethodDialog(),
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Payment Methods List
              Expanded(
                child: paymentMethods.isEmpty ? _buildEmptyState() : _buildPaymentMethodsList(),
              ),

              // Add Payment Method Button
              Container(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Container(
                    decoration: AppTheme.primaryButtonDecoration,
                    child: ElevatedButton.icon(
                      onPressed: () => _showAddPaymentMethodDialog(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text(
                        'Add Payment Method',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.credit_card_off,
            size: 80,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No payment methods found',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your payment methods for faster checkout',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: paymentMethods.length,
      itemBuilder: (context, index) {
        final paymentMethod = paymentMethods[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: AppTheme.cardDecoration.copyWith(
            border: paymentMethod.isDefault 
                ? Border.all(color: AppTheme.accentColor, width: 2)
                : null,
          ),
          child: Column(
            children: [
              // Payment Method Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: paymentMethod.isDefault 
                      ? AppTheme.accentColor.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _getPaymentMethodColor(paymentMethod.type).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        _getPaymentMethodIcon(paymentMethod.type),
                        color: _getPaymentMethodColor(paymentMethod.type),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getPaymentMethodTitle(paymentMethod),
                            style: const TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _getPaymentMethodSubtitle(paymentMethod),
                            style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (paymentMethod.isDefault) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.accentColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'DEFAULT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, color: AppTheme.textMuted),
                      color: AppTheme.surfaceColor,
                      onSelected: (value) {
                        switch (value) {
                          case 'edit':
                            _showEditPaymentMethodDialog(paymentMethod, index);
                            break;
                          case 'delete':
                            _showDeleteConfirmation(paymentMethod, index);
                            break;
                          case 'default':
                            _setAsDefault(index);
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(Icons.edit, color: AppTheme.accentColor, size: 18),
                              SizedBox(width: 8),
                              Text('Edit', style: TextStyle(color: AppTheme.textPrimary)),
                            ],
                          ),
                        ),
                        if (!paymentMethod.isDefault)
                          const PopupMenuItem(
                            value: 'default',
                            child: Row(
                              children: [
                                Icon(Icons.check_circle, color: AppTheme.successColor, size: 18),
                                SizedBox(width: 8),
                                Text('Set as Default', style: TextStyle(color: AppTheme.textPrimary)),
                              ],
                            ),
                          ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: AppTheme.errorColor, size: 18),
                              SizedBox(width: 8),
                              Text('Delete', style: TextStyle(color: AppTheme.textPrimary)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Payment Method Details
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildPaymentMethodDetails(paymentMethod),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPaymentMethodDetails(PaymentMethod paymentMethod) {
    switch (paymentMethod.type) {
      case 'card':
        return Column(
          children: [
            _buildDetailRow('Card Number', paymentMethod.cardNumber!),
            _buildDetailRow('Card Holder', paymentMethod.holderName!),
            _buildDetailRow('Expires', paymentMethod.expiryDate!),
            _buildDetailRow('Type', paymentMethod.cardType!),
          ],
        );
      case 'upi':
        return Column(
          children: [
            _buildDetailRow('UPI ID', paymentMethod.upiId!),
            _buildDetailRow('Account Holder', paymentMethod.holderName!),
          ],
        );
      case 'wallet':
        return Column(
          children: [
            _buildDetailRow('Wallet', paymentMethod.walletName!),
            _buildDetailRow('Balance', '₹${paymentMethod.balance!.toStringAsFixed(2)}'),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getPaymentMethodIcon(String type) {
    switch (type) {
      case 'card': return Icons.credit_card;
      case 'upi': return Icons.qr_code;
      case 'wallet': return Icons.account_balance_wallet;
      default: return Icons.payment;
    }
  }

  Color _getPaymentMethodColor(String type) {
    switch (type) {
      case 'card': return Colors.blue;
      case 'upi': return Colors.orange;
      case 'wallet': return Colors.green;
      default: return AppTheme.accentColor;
    }
  }

  String _getPaymentMethodTitle(PaymentMethod paymentMethod) {
    switch (paymentMethod.type) {
      case 'card': return '${paymentMethod.cardType} Card';
      case 'upi': return 'UPI';
      case 'wallet': return paymentMethod.walletName!;
      default: return 'Payment Method';
    }
  }

  String _getPaymentMethodSubtitle(PaymentMethod paymentMethod) {
    switch (paymentMethod.type) {
      case 'card': return paymentMethod.cardNumber!;
      case 'upi': return paymentMethod.upiId!;
      case 'wallet': return 'Balance: ₹${paymentMethod.balance!.toStringAsFixed(2)}';
      default: return '';
    }
  }

  void _setAsDefault(int index) {
    setState(() {
      // Remove default from all payment methods
      for (var method in paymentMethods) {
        method.isDefault = false;
      }
      // Set current as default
      paymentMethods[index].isDefault = true;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Default payment method updated'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  void _showDeleteConfirmation(PaymentMethod paymentMethod, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Delete Payment Method',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: const Text(
          'Are you sure you want to delete this payment method?',
          style: TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                paymentMethods.removeAt(index);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Payment method deleted'),
                  backgroundColor: AppTheme.errorColor,
                ),
              );
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: AppTheme.errorColor),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddPaymentMethodDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Add Payment Method',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPaymentOptionTile(
              'Credit/Debit Card',
              Icons.credit_card,
              Colors.blue,
              () {
                Navigator.pop(context);
                _showAddCardDialog();
              },
            ),
            _buildPaymentOptionTile(
              'UPI',
              Icons.qr_code,
              Colors.orange,
              () {
                Navigator.pop(context);
                _showAddUPIDialog();
              },
            ),
            _buildPaymentOptionTile(
              'Wallet',
              Icons.account_balance_wallet,
              Colors.green,
              () {
                Navigator.pop(context);
                _showAddWalletDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOptionTile(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(color: AppTheme.textPrimary),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: AppTheme.textMuted, size: 16),
      onTap: onTap,
    );
  }

  void _showAddCardDialog() {
    final formKey = GlobalKey<FormState>();
    final cardNumberController = TextEditingController();
    final holderNameController = TextEditingController();
    final expiryController = TextEditingController();
    final cvvController = TextEditingController();
    bool isDefault = paymentMethods.isEmpty;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Add Card',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCardFormField(cardNumberController, 'Card Number', Icons.credit_card),
                _buildCardFormField(holderNameController, 'Card Holder Name', Icons.person),
                Row(
                  children: [
                    Expanded(
                      child: _buildCardFormField(expiryController, 'MM/YY', Icons.date_range),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildCardFormField(cvvController, 'CVV', Icons.lock),
                    ),
                  ],
                ),
                CheckboxListTile(
                  value: isDefault,
                  onChanged: (value) {
                    setState(() {
                      isDefault = value ?? false;
                    });
                  },
                  title: const Text(
                    'Set as default',
                    style: TextStyle(color: AppTheme.textSecondary),
                  ),
                  activeColor: AppTheme.accentColor,
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final newCard = PaymentMethod(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  type: 'card',
                  cardNumber: '**** **** **** ${cardNumberController.text.substring(cardNumberController.text.length - 4)}',
                  holderName: holderNameController.text,
                  expiryDate: expiryController.text,
                  cardType: _detectCardType(cardNumberController.text),
                  isDefault: isDefault,
                );

                setState(() {
                  if (isDefault) {
                    for (var method in paymentMethods) {
                      method.isDefault = false;
                    }
                  }
                  paymentMethods.add(newCard);
                });

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Card added successfully'),
                    backgroundColor: AppTheme.successColor,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.accentColor,
            ),
            child: const Text('Add Card'),
          ),
        ],
      ),
    );
  }

  void _showAddUPIDialog() {
    final formKey = GlobalKey<FormState>();
    final upiIdController = TextEditingController();
    final holderNameController = TextEditingController();
    bool isDefault = paymentMethods.isEmpty;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Add UPI',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCardFormField(upiIdController, 'UPI ID', Icons.qr_code),
              _buildCardFormField(holderNameController, 'Account Holder Name', Icons.person),
              CheckboxListTile(
                value: isDefault,
                onChanged: (value) {
                  setState(() {
                    isDefault = value ?? false;
                  });
                },
                title: const Text(
                  'Set as default',
                  style: TextStyle(color: AppTheme.textSecondary),
                ),
                activeColor: AppTheme.accentColor,
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final newUPI = PaymentMethod(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  type: 'upi',
                  upiId: upiIdController.text,
                  holderName: holderNameController.text,
                  isDefault: isDefault,
                );

                setState(() {
                  if (isDefault) {
                    for (var method in paymentMethods) {
                      method.isDefault = false;
                    }
                  }
                  paymentMethods.add(newUPI);
                });

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('UPI added successfully'),
                    backgroundColor: AppTheme.successColor,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.accentColor,
            ),
            child: const Text('Add UPI'),
          ),
        ],
      ),
    );
  }

  void _showAddWalletDialog() {
    final wallets = ['Paytm Wallet', 'PhonePe Wallet', 'Google Pay', 'Amazon Pay'];
    String selectedWallet = wallets.first;
    bool isDefault = paymentMethods.isEmpty;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Add Wallet',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: selectedWallet,
              decoration: InputDecoration(
                labelText: 'Select Wallet',
                filled: true,
                fillColor: AppTheme.backgroundDark,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: AppTheme.textPrimary),
              dropdownColor: AppTheme.surfaceColor,
              items: wallets.map((wallet) {
                return DropdownMenuItem(
                  value: wallet,
                  child: Text(wallet),
                );
              }).toList(),
              onChanged: (value) {
                selectedWallet = value!;
              },
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              value: isDefault,
              onChanged: (value) {
                setState(() {
                  isDefault = value ?? false;
                });
              },
              title: const Text(
                'Set as default',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
              activeColor: AppTheme.accentColor,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newWallet = PaymentMethod(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                type: 'wallet',
                walletName: selectedWallet,
                balance: 0.0, // You might want to fetch actual balance
                isDefault: isDefault,
              );

              setState(() {
                if (isDefault) {
                  for (var method in paymentMethods) {
                    method.isDefault = false;
                  }
                }
                paymentMethods.add(newWallet);
              });

              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Wallet added successfully'),
                  backgroundColor: AppTheme.successColor,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.accentColor,
            ),
            child: const Text('Add Wallet'),
          ),
        ],
      ),
    );
  }

  void _showEditPaymentMethodDialog(PaymentMethod paymentMethod, int index) {
    // Implementation for editing payment methods
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit functionality coming soon')),
    );
  }

  Widget _buildCardFormField(
    TextEditingController controller,
    String label,
    IconData icon, [
    TextInputType? keyboardType,
  ]) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        style: const TextStyle(color: AppTheme.textPrimary),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: AppTheme.accentColor),
          filled: true,
          fillColor: AppTheme.backgroundDark,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppTheme.accentColor.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppTheme.accentColor),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  String _detectCardType(String cardNumber) {
    if (cardNumber.startsWith('4')) return 'Visa';
    if (cardNumber.startsWith('5')) return 'Mastercard';
    if (cardNumber.startsWith('3')) return 'American Express';
    return 'Unknown';
  }
}

