// import 'package:flutter/material.dart';
// import '../models/category.dart' as Category;
// import '../models/product.dart'; // assume you have a Product model
// import '../theme/app_theme.dart';
// import '../widgets/product_card.dart';
// import 'product_detail_screen.dart'; // Add this import if ProductDetailScreen is defined in this file



// class CategoryDetailScreen extends StatefulWidget {
//   final Category.Category category;
//   const CategoryDetailScreen({Key? key, required this.category}) : super(key: key);

//   @override
//   _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
// }

// class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
//   List<Product> products = [];
//   String sortOption = 'Popularity'; // default sort
//   bool isGridView = true; // toggle between grid/list

//   @override
//   void initState() {
//     super.initState();
//     // Mock data - replace with API call
//     products = getMockProducts();
//     _sortProducts();
//   }

//   List<Product> getMockProducts() {
//     return List.generate(10, (index) {
//       return Product(
//         id: index,
//         name: 'Product ${index + 1}',
//         images: ['/assets/img${index % 3 + 1}.jpg'],
//         price: 200 + index * 50,
//         mrp: 250 + index * 60,
//         rating: (index % 5) + 1.0,
//         description: 'Description for Product ${index + 1}',
//         reviews: 0,
//         categoryId: widget.category.id,
//         variants: [],
//         inStock: index % 3 != 0,
//       );
//     });
//   }

//   void _sortProducts() {
//     setState(() {
//       if (sortOption == 'Price: Low to High') {
//         products.sort((a, b) => a.price.compareTo(b.price));
//       } else if (sortOption == 'Price: High to Low') {
//         products.sort((a, b) => b.price.compareTo(a.price));
//       } else if (sortOption == 'Rating') {
//         products.sort((a, b) => b.rating.compareTo(a.rating));
//       } else {
//         // Default: Popularity or Last added
//         products = products.reversed.toList(); // dummy reverse
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final category = widget.category;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(category.name),
//         backgroundColor: Color(0xFF1976D2),
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
//             onPressed: () {
//               setState(() {
//                 isGridView = !isGridView;
//               });
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Category header
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFF1976D2).withOpacity(0.4),
//                   Color(0xFF1976D2).withOpacity(0.8),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Text(
//               category.name,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//           ),

//           // Sorting & Filter
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Row(
//               children: [
//                 // Sorting dropdown
//                 DropdownButton<String>(
//                   value: sortOption,
//                   items: [
//                     'Popularity',
//                     'Price: Low to High',
//                     'Price: High to Low',
//                     'Rating',
//                   ].map((value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     if (value != null) {
//                       sortOption = value;
//                       _sortProducts();
//                     }
//                   },
//                 ),
//                 const Spacer(),
//                 // Filter icon button
//                 IconButton(
//                   icon: const Icon(Icons.filter_alt),
//                   onPressed: () {
//                     // Open filter modal
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (_) => Container(
//                         height: 300,
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text('Filter Options', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                             // Add filter options here
//                             SwitchListTile(
//                               title: const Text('In Stock Only'),
//                               value: true,
//                               onChanged: (val) {},
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),

//           // Product grid/list
//           Expanded(
//             child: isGridView
//                 ? GridView.builder(
//                     padding: const EdgeInsets.all(8),
//                     physics: const BouncingScrollPhysics(),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.75,
//                       crossAxisSpacing: 8,
//                       mainAxisSpacing: 8,
//                     ),
//                     itemCount: products.length,
//                     itemBuilder: (_, index) => GestureDetector(
//                       onTap: () {
//                         // Go to product detail
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => ProductDetailScreen(product: products[index]),
//                           ),
//                         );
//                       },
//                       child: ProductCard(product: products[index]),
//                     ),
//                   )
//                 : ListView.builder(
//                     padding: const EdgeInsets.all(8),
//                     itemCount: products.length,
//                     itemBuilder: (_, index) => GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => ProductDetailScreen(product: products[index]),
//                           ),
//                         );
//                       },
//                       child: ProductCard(product: products[index], isWishlisted: true),
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Helper to parse
// Color _getCategoryColor(String colorString) {
//   try {
//     return Color(int.parse(colorString.replaceAll('#', '0xFF')));
//   } catch (e) {
//     return Colors.green; // fallback
//   }
// }
