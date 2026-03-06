import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cart/ui/cart_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      // Back Button
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20.sp),
        onPressed: () => Navigator.pop(context),
      ),

      // Brand Logo and Name
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.headphones, color: const Color(0xFF0B50DA), size: 24.sp),
          SizedBox(width: 8.w),
          Text(
            'MINIMAL',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
      centerTitle: true,

      // Actions (Search & Cart)
      actions: [
        IconButton(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.grey.shade700,
            size: 24.sp,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            );
          },
        ),
        SizedBox(width: 8.w),
      ],
    );
  }

  // Required size for AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
