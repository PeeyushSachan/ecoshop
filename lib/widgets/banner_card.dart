// import 'package:ecoshop/models/product_model.dart';
// import 'package:ecoshop/theme/app_theme.dart';
// import 'package:flutter/material.dart';

// class BannerCard extends StatelessWidget {
//   final models.Banner banner;
//   final VoidCallback? onTap;

//   const BannerCard({
//     Key? key,
//     required this.banner,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Stack(
//             children: [
//               // Background Image
//               Container(
//                 height: 160,
//                 width: double.infinity,
//                 child: Image.network(
//                   banner.image,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       decoration: AppTheme.gradientCardDecoration,
//                     );
//                   },
//                 ),
//               ),
              
//               // Gradient Overlay
//               Container(
//                 height: 160,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     colors: [
//                       Colors.black.withOpacity(0.7),
//                       Colors.transparent,
//                     ],
//                   ),
//                 ),
//               ),
              
//               // Content
//               Positioned(
//                 left: 24,
//                 top: 0,
//                 bottom: 0,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       banner.title,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       banner.subtitle,
//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     if (banner.buttonText != null)
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         decoration: BoxDecoration(
//                           color: AppTheme.accentColor,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Text(
//                           banner.buttonText!,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }