import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/shared_add_to_cart_button.dart';
import '../../cart/ui/cart_screen.dart';

class AddToCartSection extends StatelessWidget {
  final ProductModel product;
  const AddToCartSection({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Row(
        children: [
          Container(
            height: 48.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: SharedAddToCartButton(
              onPressed: () {
                context.read<CartCubit>().addItem(product);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                );
              },
              text: 'Add to Cart',
            ),
          ),
        ],
      ),
    );
  }
}