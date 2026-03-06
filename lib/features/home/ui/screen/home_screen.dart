import 'package:e_commerce_app/core/widgets/app_header.dart';
import 'package:e_commerce_app/features/home/data/repositories/home_repository.dart';
import 'package:e_commerce_app/features/home/ui/cubit/home_cubit.dart';
import 'package:e_commerce_app/features/home/ui/cubit/home_state.dart';
import 'package:e_commerce_app/features/home/ui/widgets/banner_widget.dart';
import 'package:e_commerce_app/features/home/ui/widgets/categories_list.dart';
import 'package:e_commerce_app/features/home/ui/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepository())..getProducts(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const AppHeader(),
                SizedBox(height: 20.h),
                const BannerWidget(),
                SizedBox(height: 15.h),
                const CategoriesList(),
                SizedBox(height: 15.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is HomeError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is HomeLoaded) {
                      return ProductGrid(
                        products: state.products,
                        selectedFilter: state.selectedFilter,
                        onFilterChanged: (index) {
                          context.read<HomeCubit>().changeFilter(index);
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}