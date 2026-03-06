import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedAddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SharedAddToCartButton({
    Key? key,
    required this.onPressed,
    this.text = 'Add to Cart',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.shopping_bag_outlined, 
        size: 20.sp, 
        color: Colors.white,
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp, 
          fontWeight: FontWeight.w600, 
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0B50DA),
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 4,
        shadowColor: const Color(0xFF0B50DA).withOpacity(0.2),
      ),
    );
  }
}