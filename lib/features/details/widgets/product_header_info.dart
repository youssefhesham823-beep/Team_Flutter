import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/data/models/product_model.dart';

class ProductHeaderInfo extends StatelessWidget {
  final ProductModel product;
  const ProductHeaderInfo({Key? key ,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Title
        Text(
          product.name,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),

        // Rating Stars and Reviews
        Row(
          children: [
            // Generate 4 filled stars
            ...List.generate(4, (index) => Icon(Icons.star, color: Colors.amber, size: 20.sp)),
            // 1 empty star
            Icon(Icons.star, color: Colors.grey.shade300, size: 20.sp),
            SizedBox(width: 8.w),
            // Reviews count text
            Text(
              '124 Reviews',
              style: TextStyle(color: const Color(0xFF0B50DA), fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Prices and Discount Badge
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Current Price
            Text(
              '${product.price.toString()}\$',
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 12.w),
            // Old Price (Line through)
            Text(
              '\$349.00',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: 12.w),
            // Discount Badge (Save 15%)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'SAVE 15%',
                style: TextStyle(color: Colors.green.shade700, fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        
        // Divider line
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Divider(color: Colors.grey.shade200, thickness: 1.h),
        ),

        // Product Description
        Text(
          'Experience immersive sound with active noise cancellation and a 30-hour battery life. Designed for audiophiles, these headphones feature memory foam ear cups for all-day comfort and seamless Bluetooth 5.2 connectivity.',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade700, height: 1.5),
        ),
      ],
    );
  }
}