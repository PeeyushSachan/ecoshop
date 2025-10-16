class UserProfileModel {
  final String name;
  final String email;
  final String? phone;
  final String? avatar;
  final int orders;
  final int wishlist;

  UserProfileModel({
    required this.name,
    required this.email,
    this.phone,
    this.avatar,
    required this.orders,
    required this.wishlist,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      orders: json['orders'],
      wishlist: json['wishlist'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'orders': orders,
      'wishlist': wishlist,
    };
  }
}