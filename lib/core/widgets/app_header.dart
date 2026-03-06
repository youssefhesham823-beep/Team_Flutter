import 'package:e_commerce_app/features/cart/ui/cart_screen.dart';
import 'package:e_commerce_app/features/favorites/ui/screen/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.shopping_bag, color: Colors.white, size: 20.sp),
          ),
          SizedBox(width: 10.w),
          Text(
            "MINIMAL",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FavoriteScreen(),
                ),
              );
            },
            child: Icon(Icons.favorite_border, size: 24.sp, color: Colors.black87),
          ),
          SizedBox(width: 15.w),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.shopping_cart_outlined, size: 24.sp, color: Colors.black87),
                Positioned(
                  right: -4.w,
                  top: -4.h,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 15.w),
          CircleAvatar(
            radius: 18.r,
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