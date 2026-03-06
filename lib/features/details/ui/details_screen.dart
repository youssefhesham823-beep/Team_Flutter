import 'package:e_commerce_app/features/details/cubit/product_details_cubit.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/add_to_cart_section.dart';
import '../widgets/product_header_info.dart';
import '../widgets/product_image_gallery.dart';
import '../widgets/product_variants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/trust_badges.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6F8),
        // 1. Use the CustomAppBar instead of the inline one
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Gallery (Main Image & Thumbnails)
                const ProductImageGallery(),

                SizedBox(height: 24.h),

                // Product Header Info (Title, Rating, Price, Description)
                ProductHeaderInfo(product: product),

                // Variants (Colors and Models)
                const ProductVariants(),

                AddToCartSection(product: product),

                const TrustBadges(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
