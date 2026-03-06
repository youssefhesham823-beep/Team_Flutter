import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // import bloc
import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';

class ProductVariants extends StatelessWidget {
  const ProductVariants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> productColors = [
      {'name': 'Midnight Blue', 'color': const Color(0xFF1E293B)},
      {'name': 'Silver', 'color': const Color(0xFFE2E8F0)},
      {'name': 'Matte Black', 'color': const Color(0xFF111827)},
    ];

    final List<Map<String, dynamic>> productModels = [
      {'title': 'Standard', 'isDisabled': false},
      {'title': 'Pro', 'isDisabled': false},
      {'title': 'Max', 'isDisabled': false},
    ];

    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        
        var cubit = context.read<ProductDetailsCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            
            Text(
              'Color: ${productColors[state.selectedColorIndex]['name']}',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12.h),
            // ---------- colors ---------------
            Row(
              children: List.generate(productColors.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: GestureDetector(
                    onTap: () {
                      cubit.changeColor(index);
                    },
                    child: _buildColorCircle(
                      color: productColors[index]['color'],
                      isSelected: state.selectedColorIndex == index, // بنقارن بالـ state
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 24.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Model', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
              ],
            ),
            // -- models --------------
            SizedBox(height: 12.h),
            Row(
              children: List.generate(productModels.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: index != productModels.length - 1 ? 8.w : 0),
                    child: GestureDetector(
                      onTap: () {
                        if (!productModels[index]['isDisabled']) {
                          cubit.changeModel(index);
                        }
                      },
                      child: _buildModelButton(
                        title: productModels[index]['title'],
                        isSelected: state.selectedModelIndex == index, // بنقارن بالـ state
                        isDisabled: productModels[index]['isDisabled'],
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

  Widget _buildColorCircle({required Color color, required bool isSelected}) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFF0B50DA) : Colors.transparent,
          width: 2.w,
        ),
      ),
    );
  }

  Widget _buildModelButton({required String title, required bool isSelected, bool isDisabled = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF0B50DA).withOpacity(0.05) : (isDisabled ? Colors.grey.shade100 : Colors.white),
        border: Border.all(
          color: isSelected ? const Color(0xFF0B50DA) : Colors.grey.shade300,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xFF0B50DA) : (isDisabled ? Colors.grey.shade400 : Colors.black),
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}