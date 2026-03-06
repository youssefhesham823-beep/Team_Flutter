import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrustBadges extends StatelessWidget {
  const TrustBadges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
      child: Row(
        children: [
          // Free Shipping Badge
          Expanded(
            child: _buildBadgeCard(
              icon: Icons.local_shipping_outlined,
              title: 'Free Shipping',
              subtitle: 'On orders over \$50',
            ),
          ),
          SizedBox(width: 12.w),
          
          // Warranty Badge
          Expanded(
            child: _buildBadgeCard(
              icon: Icons.verified_user_outlined,
              title: '2 Year Warranty',
              subtitle: 'Full coverage included',
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a badge card
  Widget _buildBadgeCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // Icon with light blue background
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFF0B50DA).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: const Color(0xFF0B50DA),
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          
          // Text info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Add ... if text is too long
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}