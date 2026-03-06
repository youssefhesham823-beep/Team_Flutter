import 'package:e_commerce_app/features/details/cubit/product_details_cubit.dart';
import 'package:e_commerce_app/features/details/cubit/product_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/data/models/product_model.dart';

class ProductImageGallery extends StatelessWidget {
  final ProductModel product;
  const ProductImageGallery({Key? key, required this.product})
    : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is! ProductDetailsLoaded) return const SizedBox();

        var cubit = context.read<ProductDetailsCubit>();
        int currentImageIndex = state.selectedImageIndex;

        return Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 340.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      product.images[currentImageIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(product.images.length, (index) {
                bool isSelected = index == currentImageIndex;

                return GestureDetector(
                  onTap: () {
                    cubit.changeImage(index);
                  },
                  child: Container(
                    width: 105.w,
                    height: 105.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF0B50DA)
                            : Colors.grey.shade300,
                        width: isSelected ? 2.w : 1.w,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        product.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
