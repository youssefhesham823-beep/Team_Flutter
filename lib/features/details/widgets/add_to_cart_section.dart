import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Import the shared button from your core folder
import '../../../core/widgets/shared_add_to_cart_button.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Row(
        children: [
          // Quantity Counter
          Container(
            height: 48.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16.w),
          
          // Shared Add to Cart Button (takes remaining space)
          Expanded(
            child: SharedAddToCartButton(
              onPressed: () {
                // TODO: Add to cart logic here later
              },
              text: 'Add to Cart',
            ),
          ),
        ],
      ),
    );
  }
}