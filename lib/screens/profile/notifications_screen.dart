import 'package:ecoshop/models/ui/notification_item_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> with SingleTickerProviderStateMixin {
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

  // Sample Notifications Data
  final List<NotificationItemModel> allNotifications = [
    // Order Updates
    NotificationItemModel(
      id: "1",
      type: "order",
      title: "Order Delivered Successfully",
      message: "Your order #ORD001 has been delivered. Thank you for shopping with us!",
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
      icon: Icons.check_circle,
      color: AppTheme.successColor,
    ),
    NotificationItemModel(
      id: "2",
      type: "order",
      title: "Order Out for Delivery",
      message: "Your order #ORD002 is out for delivery and will reach you soon.",
      timestamp: DateTime.now().subtract(const Duration(hours: 4)),
      isRead: true,
      icon: Icons.local_shipping,
      color: Colors.blue,
    ),
    NotificationItemModel(
      id: "3",
      type: "order",
      title: "Order Confirmed",
      message: "Your order #ORD003 has been confirmed and is being processed.",
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
      icon: Icons.shopping_bag,
      color: AppTheme.accentColor,
    ),
    
    // Offers & Promotions
    NotificationItemModel(
      id: "4",
      type: "offer",
      title: "Flash Sale Alert! 🔥",
      message: "Up to 70% off on electronics. Limited time offer ends in 6 hours!",
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      isRead: false,
      icon: Icons.flash_on,
      color: Colors.orange,
    ),
    NotificationItemModel(
      id: "5",
      type: "offer",
      title: "New Coupon Available",
      message: "Use code SAVE20 and get ₹200 off on orders above ₹1999. Valid till tomorrow!",
      timestamp: DateTime.now().subtract(const Duration(hours: 6)),
      isRead: false,
      icon: Icons.local_offer,
      color: AppTheme.accentColor,
    ),
    NotificationItemModel(
      id: "6",
      type: "offer",
      title: "Weekend Special Offer",
      message: "Get 30% off on fashion items this weekend. Don't miss out!",
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
      icon: Icons.weekend,
      color: Colors.purple,
    ),
    
    // Account Updates
    NotificationItemModel(
      id: "7",
      type: "account",
      title: "Welcome to EcoShop!",
      message: "Thank you for joining us. Explore our wide range of products and enjoy shopping!",
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
      icon: Icons.celebration,
      color: AppTheme.accentColor,
    ),
    NotificationItemModel(
      id: "8",
      type: "account",
      title: "Profile Updated",
      message: "Your profile information has been updated successfully.",
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      isRead: true,
      icon: Icons.person,
      color: Colors.blue,
    ),
    
    // General Notifications
    NotificationItemModel(
      id: "9",
      type: "general",
      title: "App Update Available",
      message: "A new version of EcoShop is available. Update now for the latest features!",
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: false,
      icon: Icons.system_update,
      color: Colors.indigo,
    ),
    NotificationItemModel(
      id: "10",
      type: "general",
      title: "New Features Added",
      message: "Check out our new wishlist feature and save your favorite items!",
      timestamp: DateTime.now().subtract(const Duration(days: 4)),
      isRead: true,
      icon: Icons.new_releases,
      color: AppTheme.accentColor,
    ),
  ];

  List<NotificationItemModel> get unreadNotifications => 
      allNotifications.where((n) => !n.isRead).toList();

  List<NotificationItemModel> get orderNotifications => 
      allNotifications.where((n) => n.type == 'order').toList();

  List<NotificationItemModel> get offerNotifications => 
      allNotifications.where((n) => n.type == 'offer').toList();

  List<NotificationItemModel> get otherNotifications => 
      allNotifications.where((n) => !['order', 'offer'].contains(n.type)).toList();

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
                      'Notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    // Mark all as read
                    TextButton(
                      onPressed: unreadNotifications.isNotEmpty ? _markAllAsRead : null,
                      child: Text(
                        'Mark all read',
                        style: TextStyle(
                          color: unreadNotifications.isNotEmpty 
                              ? Colors.white 
                              : Colors.white.withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
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
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'All (${allNotifications.length})'),
                    Tab(text: 'Orders (${orderNotifications.length})'),
                    Tab(text: 'Offers (${offerNotifications.length})'),
                    Tab(text: 'Others (${otherNotifications.length})'),
                  ],
                ),
              ),

              // Notifications Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildNotificationsList(allNotifications),
                    _buildNotificationsList(orderNotifications),
                    _buildNotificationsList(offerNotifications),
                    _buildNotificationsList(otherNotifications),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationsList(List<NotificationItemModel> notifications) {
    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off,
              size: 80,
              color: Colors.white.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'No notifications found',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'We\'ll notify you when something important happens',
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

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: _buildNotificationCard(notification),
        );
      },
    );
  }

  Widget _buildNotificationCard(NotificationItemModel notification) {
    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: AppTheme.errorColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 24,
        ),
      ),
      onDismissed: (direction) {
        _deleteNotification(notification);
      },
      child: GestureDetector(
        onTap: () => _markAsRead(notification),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: notification.isRead 
                  ? AppTheme.textMuted.withOpacity(0.3)
                  : AppTheme.accentColor.withOpacity(0.3),
              width: notification.isRead ? 1 : 2,
            ),
          ),
          child: Column(
            children: [
              // Notification Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: notification.isRead 
                      ? Colors.transparent
                      : AppTheme.accentColor.withOpacity(0.05),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    // Notification Icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: notification.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        notification.icon,
                        color: notification.color,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Notification Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  notification.title,
                                  style: TextStyle(
                                    color: AppTheme.textPrimary,
                                    fontSize: 16,
                                    fontWeight: notification.isRead 
                                        ? FontWeight.w600 
                                        : FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (!notification.isRead)
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: AppTheme.accentColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            notification.message,
                            style: TextStyle(
                              color: notification.isRead 
                                  ? AppTheme.textMuted 
                                  : AppTheme.textSecondary,
                              fontSize: 14,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _getTimeAgo(notification.timestamp),
                            style: const TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // More Options
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, color: AppTheme.textMuted, size: 20),
                      color: AppTheme.surfaceColor,
                      onSelected: (value) {
                        switch (value) {
                          case 'mark_read':
                            _markAsRead(notification);
                            break;
                          case 'mark_unread':
                            _markAsUnread(notification);
                            break;
                          case 'delete':
                            _deleteNotification(notification);
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        if (!notification.isRead)
                          const PopupMenuItem(
                            value: 'mark_read',
                            child: Row(
                              children: [
                                Icon(Icons.mark_email_read, color: AppTheme.accentColor, size: 18),
                                SizedBox(width: 8),
                                Text('Mark as read', style: TextStyle(color: AppTheme.textPrimary)),
                              ],
                            ),
                          )
                        else
                          const PopupMenuItem(
                            value: 'mark_unread',
                            child: Row(
                              children: [
                                Icon(Icons.mark_email_unread, color: AppTheme.accentColor, size: 18),
                                SizedBox(width: 8),
                                Text('Mark as unread', style: TextStyle(color: AppTheme.textPrimary)),
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

              // Action Buttons (for certain notification types)
              if (notification.type == 'offer') ...[
                const Divider(color: AppTheme.textMuted, height: 1),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Navigating to offers page...')),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppTheme.accentColor),
                            foregroundColor: AppTheme.accentColor,
                          ),
                          icon: const Icon(Icons.local_offer, size: 16),
                          label: const Text('View Offer'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Navigating to shop...')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.accentColor,
                          ),
                          icon: const Icon(Icons.shopping_bag, size: 16),
                          label: const Text('Shop Now'),
                        ),
                      ),
                    ],
                  ),
                ),
              ] else if (notification.type == 'order') ...[
                const Divider(color: AppTheme.textMuted, height: 1),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Navigating to order details...')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accentColor,
                      ),
                      icon: const Icon(Icons.receipt, size: 16),
                      label: const Text('View Order'),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  void _markAsRead(NotificationItemModel notification) {
    setState(() {
      notification.isRead = true;
    });
  }

  void _markAsUnread(NotificationItemModel notification) {
    setState(() {
      notification.isRead = false;
    });
  }

  void _markAllAsRead() {
    setState(() {
      for (var notification in allNotifications) {
        notification.isRead = true;
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All notifications marked as read'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  void _deleteNotification(NotificationItemModel notification) {
    setState(() {
      allNotifications.removeWhere((n) => n.id == notification.id);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Notification deleted'),
        backgroundColor: AppTheme.errorColor,
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              allNotifications.add(notification);
              allNotifications.sort((a, b) => b.timestamp.compareTo(a.timestamp));
            });
          },
        ),
      ),
    );
  }
}

