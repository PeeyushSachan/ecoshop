import 'package:ecoshop/models/address_Model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ManageAddressScreen extends StatefulWidget {
  const ManageAddressScreen({Key? key}) : super(key: key);

  @override
  State<ManageAddressScreen> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  List<Address> addresses = [
    Address(
      id: "1",
      name: "John Doe",
      phone: "+91 9876543210",
      addressLine1: "123 MG Road",
      addressLine2: "Near City Mall",
      city: "Mumbai",
      state: "Maharashtra",
      pincode: "400001",
      isDefault: true,
      type: "Home",
    ),
    Address(
      id: "2",
      name: "John Doe",
      phone: "+91 9876543210",
      addressLine1: "456 Park Street",
      addressLine2: "Sector 15",
      city: "Delhi",
      state: "Delhi",
      pincode: "110001",
      isDefault: false,
      type: "Office",
    ),
    Address(
      id: "3",
      name: "Jane Doe",
      phone: "+91 9876543211",
      addressLine1: "789 Lake View Apartments",
      addressLine2: "Block A, Flat 301",
      city: "Bangalore",
      state: "Karnataka",
      pincode: "560001",
      isDefault: false,
      type: "Other",
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
                      'Manage Addresses',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => _showAddAddressDialog(),
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Addresses List
              Expanded(
                child: addresses.isEmpty ? _buildEmptyState() : _buildAddressList(),
              ),

              // Add Address Button
              Container(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Container(
                    decoration: AppTheme.primaryButtonDecoration,
                    child: ElevatedButton.icon(
                      onPressed: () => _showAddAddressDialog(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text(
                        'Add New Address',
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
            Icons.location_off,
            size: 80,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No addresses found',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your delivery addresses for faster checkout',
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

  Widget _buildAddressList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        final address = addresses[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: AppTheme.cardDecoration.copyWith(
            border: address.isDefault 
                ? Border.all(color: AppTheme.accentColor, width: 2)
                : null,
          ),
          child: Column(
            children: [
              // Address Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: address.isDefault 
                      ? AppTheme.accentColor.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      _getAddressTypeIcon(address.type),
                      color: AppTheme.accentColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      address.type,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (address.isDefault) ...[
                      const SizedBox(width: 8),
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
                    ],
                    const Spacer(),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, color: AppTheme.textMuted),
                      color: AppTheme.surfaceColor,
                      onSelected: (value) {
                        switch (value) {
                          case 'edit':
                            _showEditAddressDialog(address, index);
                            break;
                          case 'delete':
                            _showDeleteConfirmation(address, index);
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
                        if (!address.isDefault)
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

              // Address Details
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      address.phone,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${address.addressLine1}\n${address.addressLine2}\n${address.city}, ${address.state} - ${address.pincode}',
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  IconData _getAddressTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'home':
        return Icons.home;
      case 'office':
        return Icons.business;
      default:
        return Icons.location_on;
    }
  }

  void _setAsDefault(int index) {
    setState(() {
      // Remove default from all addresses
      for (var address in addresses) {
        address.isDefault = false;
      }
      // Set current as default
      addresses[index].isDefault = true;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Default address updated'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  void _showDeleteConfirmation(Address address, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Delete Address',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: const Text(
          'Are you sure you want to delete this address?',
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
                addresses.removeAt(index);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Address deleted'),
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

  void _showAddAddressDialog() {
    _showAddressDialog(null, -1);
  }

  void _showEditAddressDialog(Address address, int index) {
    _showAddressDialog(address, index);
  }

  void _showAddressDialog(Address? existingAddress, int index) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: existingAddress?.name ?? '');
    final phoneController = TextEditingController(text: existingAddress?.phone ?? '');
    final addressLine1Controller = TextEditingController(text: existingAddress?.addressLine1 ?? '');
    final addressLine2Controller = TextEditingController(text: existingAddress?.addressLine2 ?? '');
    final cityController = TextEditingController(text: existingAddress?.city ?? '');
    final stateController = TextEditingController(text: existingAddress?.state ?? '');
    final pincodeController = TextEditingController(text: existingAddress?.pincode ?? '');
    String selectedType = existingAddress?.type ?? 'Home';
    bool isDefault = existingAddress?.isDefault ?? false;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: Text(
          existingAddress == null ? 'Add Address' : 'Edit Address',
          style: const TextStyle(color: AppTheme.textPrimary),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Address Type Selection
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundDark,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: ['Home', 'Office', 'Other'].map((type) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedType = type;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: selectedType == type ? AppTheme.accentColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              type,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedType == type ? Colors.white : AppTheme.textSecondary,
                                fontWeight: selectedType == type ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Form Fields
                _buildFormField(nameController, 'Full Name', Icons.person),
                _buildFormField(phoneController, 'Phone Number', Icons.phone, TextInputType.phone),
                _buildFormField(addressLine1Controller, 'Address Line 1', Icons.home),
                _buildFormField(addressLine2Controller, 'Address Line 2 (Optional)', Icons.home,),
                Row(
                  children: [
                    Expanded(child: _buildFormField(cityController, 'City', Icons.location_city)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildFormField(stateController, 'State', Icons.map)),
                  ],
                ),
                _buildFormField(pincodeController, 'Pincode', Icons.pin_drop, TextInputType.number),
                
                // Default Address Checkbox
                CheckboxListTile(
                  value: isDefault,
                  onChanged: (value) {
                    setState(() {
                      isDefault = value ?? false;
                    });
                  },
                  title: const Text(
                    'Set as default address',
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
                final newAddress = Address(
                  id: existingAddress?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameController.text,
                  phone: phoneController.text,
                  addressLine1: addressLine1Controller.text,
                  addressLine2: addressLine2Controller.text,
                  city: cityController.text,
                  state: stateController.text,
                  pincode: pincodeController.text,
                  type: selectedType,
                  isDefault: isDefault,
                );

                setState(() {
                  if (existingAddress == null) {
                    // Add new address
                    if (isDefault) {
                      for (var addr in addresses) {
                        addr.isDefault = false;
                      }
                    }
                    addresses.add(newAddress);
                  } else {
                    // Edit existing address
                    if (isDefault) {
                      for (var addr in addresses) {
                        addr.isDefault = false;
                      }
                    }
                    addresses[index] = newAddress;
                  }
                });

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(existingAddress == null ? 'Address added' : 'Address updated'),
                    backgroundColor: AppTheme.successColor,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.accentColor,
            ),
            child: Text(existingAddress == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(
    TextEditingController controller,
    String label,
    IconData icon, [
    TextInputType? keyboardType,
    bool required = true,
  ]) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
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
        validator: required ? (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        } : null,
      ),
    );
  }
}

