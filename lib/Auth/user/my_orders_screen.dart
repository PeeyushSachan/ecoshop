import 'package:ecoshop/models/order_item_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/product_model.dart';
import '../../screens/product_detail_screen.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Sample Orders Data
  final List<OrderItem> allOrders = [
    OrderItem(
      id: "ORD001",
      status: "delivered",
      orderDate: DateTime.now().subtract(const Duration(days: 3)),
      deliveryDate: DateTime.now().subtract(const Duration(days: 1)),
      totalAmount: 25999,
      items: [
        ProductModel(
          id: 101,
          name: "iPhone 15 Pro Max",
          description: "Latest flagship smartphone",
          images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
          price: 89999,
          mrp: 99999,
          rating: 4.8,
          reviews: 1234,
          categoryId: 1,
          variants: [],
          inStock: true,
          brand: "Apple",
        ),
      ],
      trackingNumber: "TRK123456789",
    ),
    OrderItem(
      id: "ORD002",
      status: "shipped",
      orderDate: DateTime.now().subtract(const Duration(days: 2)),
      deliveryDate: DateTime.now().add(const Duration(days: 1)),
      totalAmount: 12999,
      items: [
        ProductModel(
          id: 201,
          name: "Nike Air Max 270",
          description: "Comfortable running shoes",
          images: ["https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"],
          price: 8999,
          mrp: 12999,
          rating: 4.6,
          reviews: 892,
          categoryId: 2,
          variants: [],
          inStock: true,
          brand: "Nike",
        ),
      ],
      trackingNumber: "TRK987654321",
    ),
    OrderItem(
      id: "ORD003",
      status: "processing",
      orderDate: DateTime.now().subtract(const Duration(days: 1)),
      deliveryDate: DateTime.now().add(const Duration(days: 3)),
      totalAmount: 15999,
      items: [
        ProductModel(
          id: 301,
          name: "IKEA Malm Bed Frame",
          description: "Modern wooden bed frame",
          images: ["https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400"],
          price: 12999,
          mrp: 15999,
          rating: 4.3,
          reviews: 234,
          categoryId: 3,
          variants: [],
          inStock: true,
          brand: "IKEA",
        ),
      ],
      trackingNumber: "TRK456789123",
    ),
    OrderItem(
      id: "ORD004",
      status: "cancelled",
      orderDate: DateTime.now().subtract(const Duration(days: 5)),
      deliveryDate: null,
      totalAmount: 3999,
      items: [
        ProductModel(
          id: 204,
          name: "Zara Cotton T-Shirt",
          description: "Premium cotton t-shirt",
          images: ["https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400"],
          price: 1299,
          mrp: 1999,
          rating: 4.2,
          reviews: 456,
          categoryId: 2,
          variants: [],
          inStock: true,
          brand: "Zara",
        ),
      ],
      trackingNumber: null,
    ),
  ];

  List<OrderItem> get filteredOrders {
    switch (_tabController.index) {
      case 0: return allOrders;
      case 1: return allOrders.where((order) => order.status == 'processing').toList();
      case 2: return allOrders.where((order) => order.status == 'shipped').toList();
      case 3: return allOrders.where((order) => order.status == 'delivered').toList();
      default: return allOrders;
    }
  }

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
                      'My Orders',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // Search orders
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Search orders functionality')),
                        );
                      },
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Tab Bar
              Container(
                decoration: const BoxDecoration(
                  color: AppTheme.surfaceColor,
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: AppTheme.accentColor,
                  unselectedLabelColor: AppTheme.textMuted,
                  indicatorColor: AppTheme.accentColor,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  tabs: const [
                    Tab(text: 'All Orders'),
                    Tab(text: 'Processing'),
                    Tab(text: 'Shipped'),
                    Tab(text: 'Delivered'),
                  ],
                ),
              ),

              // Orders List
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: List.generate(4, (index) => _buildOrdersList()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersList() {
    final orders = filteredOrders;
    
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 80,
              color: Colors.white.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'No orders found',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start shopping to see your orders here',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: AppTheme.cardDecoration,
          child: Column(
            children: [
              // Order Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _getStatusColor(order.status).withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #${order.id}',
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Placed on ${_formatDate(order.orderDate)}',
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    _buildStatusChip(order.status),
                  ],
                ),
              ),

              // Order Items
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ...order.items.map((product) => _buildOrderItem(product, order)),
                    
                    const SizedBox(height: 16),
                    const Divider(color: AppTheme.textMuted),
                    const SizedBox(height: 16),
                    
                    // Order Summary
                    Row(
                      children: [
                        const Text(
                          'Total Amount:',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '₹${order.totalAmount.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Action Buttons
                    Row(
                      children: [
                        if (order.status != 'cancelled') ...[
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                _showTrackingDialog(order);
                              },
                              icon: const Icon(Icons.local_shipping, size: 16),
                              label: const Text('Track Order'),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: AppTheme.accentColor),
                                foregroundColor: AppTheme.accentColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _showOrderDetails(order);
                            },
                            icon: const Icon(Icons.receipt, size: 16),
                            label: const Text('View Details'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.accentColor,
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildOrderItem(ProductModel product, OrderItem order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.images.isNotEmpty ? product.images.first : 'https://via.placeholder.com/200',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppTheme.surfaceColor,
                    child: const Icon(Icons.image_not_supported, color: AppTheme.textMuted),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (product.brand != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    'by ${product.brand}',
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                    ),
                  ),
                ],
                const SizedBox(height: 4),
                Text(
                  '₹${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Reorder Button
          if (order.status == 'delivered')
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} added to cart')),
                );
              },
              icon: const Icon(Icons.refresh, color: AppTheme.accentColor),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color = _getStatusColor(status);
    IconData icon = _getStatusIcon(status);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 4),
          Text(
            status.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'processing': return Colors.orange;
      case 'shipped': return Colors.blue;
      case 'delivered': return AppTheme.successColor;
      case 'cancelled': return AppTheme.errorColor;
      default: return AppTheme.textMuted;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'processing': return Icons.hourglass_empty;
      case 'shipped': return Icons.local_shipping;
      case 'delivered': return Icons.check_circle;
      case 'cancelled': return Icons.cancel;
      default: return Icons.info;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showTrackingDialog(OrderItem order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Track Order',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order #${order.id}',
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (order.trackingNumber != null) ...[
              const SizedBox(height: 8),
              Text(
                'Tracking: ${order.trackingNumber}',
                style: const TextStyle(color: AppTheme.textSecondary),
              ),
            ],
            const SizedBox(height: 16),
            _buildTrackingStep('Order Placed', true, order.orderDate),
            _buildTrackingStep('Processing', order.status != 'cancelled', null),
            _buildTrackingStep('Shipped', ['shipped', 'delivered'].contains(order.status), null),
            _buildTrackingStep('Delivered', order.status == 'delivered', order.deliveryDate),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingStep(String title, bool isCompleted, DateTime? date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? AppTheme.successColor : AppTheme.textMuted,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: isCompleted ? AppTheme.textPrimary : AppTheme.textMuted,
                fontWeight: isCompleted ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          if (date != null)
            Text(
              _formatDate(date),
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }

  void _showOrderDetails(OrderItem order) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.backgroundDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Details - #${order.id}',
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow('Order Date', _formatDate(order.orderDate)),
              if (order.deliveryDate != null)
                _buildDetailRow('Delivery Date', _formatDate(order.deliveryDate!)),
              if (order.trackingNumber != null)
                _buildDetailRow('Tracking Number', order.trackingNumber!),
              _buildDetailRow('Status', order.status.toUpperCase()),
              _buildDetailRow('Total Amount', '₹${order.totalAmount.toStringAsFixed(0)}'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Download invoice
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invoice downloaded')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accentColor,
                      ),
                      child: const Text('Download Invoice'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              color: AppTheme.textSecondary,
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
}

