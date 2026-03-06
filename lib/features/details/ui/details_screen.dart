import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // <-- Import Bloc

import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';
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
      create: (context) => ProductDetailsCubit()..fetchProductDetails(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6F8), 
        appBar: const CustomAppBar(), 
        
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            
            if (state is ProductDetailsLoading || state is ProductDetailsInitial) {
              return const Center(child: CircularProgressIndicator(color: Color(0xFF0B50DA)));
            }
            
            if (state is ProductDetailsError) {
              return Center(
                child: Text(state.message, style: TextStyle(fontSize: 18.sp, color: Colors.red)),
              );
            }

            if (state is ProductDetailsLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProductImageGallery(),
                      SizedBox(height: 24.h),
                      ProductHeaderInfo(product: product),
                      const ProductVariants(),
                      AddToCartSection(product: product),
                      const TrustBadges(),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox(); 
          },
        ),
      ),
    );
  }
}