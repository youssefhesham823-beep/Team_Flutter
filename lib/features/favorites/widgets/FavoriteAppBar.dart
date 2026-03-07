import 'package:e_commerce_app/features/cart/ui/cart_screen.dart';
import 'package:e_commerce_app/features/favorites/ui/screen/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Favoriteappbar extends StatelessWidget {
  const Favoriteappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // زودنا الـ vertical padding عشان نفصل الـ AppBar عن اللي فوقه وتحته
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          // 1. Logo (تصغير بسيط للـ padding والـ icon)
          Container(
            padding: EdgeInsets.all(6.w), 
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(Icons.shopping_bag, color: Colors.white, size: 18.sp),
          ),
          
          // مسافة ثابتة بعد اللوجو
          SizedBox(width: 12.w),

          // 2. Search Bar (تقليل الارتفاع والخط)
          Expanded(
            child: Container(
              height: 36.h, // صغرنا الارتفاع سنة
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: TextField(
                style: TextStyle(fontSize: 12.sp), // تصغير خط الكتابة
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: "Search...",
                  hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  prefixIcon: Icon(Icons.search, size: 16.sp, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // مسافة قبل الأيقونات
          SizedBox(width: 12.w),

          // 3. Actions (تصغير الأيقونات والأفاتار)
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FavoriteScreen()),
            ),
            child: Icon(Icons.favorite_border, size: 20.sp, color: Colors.black87),
          ),
          
          SizedBox(width: 14.w), // مسافة بين الأيقونات
          
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen()),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.shopping_cart_outlined, size: 20.sp, color: Colors.black87),
                Positioned(
                  right: -3.w,
                  top: -3.h,
                  child: Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7.sp, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(width: 14.w),
          
          CircleAvatar(
            radius: 15.r, 
            backgroundColor: Colors.grey.shade200,
            backgroundImage: const NetworkImage(
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
            ),
          ),
        ],
      ),
    );
  }
}   