import 'package:e_commerce_app/features/favorites/widgets/FavoriteHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/favorites/ui/cubit/favorites_cubit.dart';
import 'package:e_commerce_app/features/favorites/ui/cubit/favorites_state.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/favorites/widgets/FavoriteEmpty.dart';
import 'package:e_commerce_app/features/favorites/widgets/FavoriteListView.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            List<ProductModel> favoriteProducts = [];
            if (state is FavoritesUpdated) {
              favoriteProducts = state.favorites
                  .where((p) => p.isFavorite)
                  .toList();
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FavoriteHeader(count: favoriteProducts.length),

                  const SizedBox(height: 32),

                  favoriteProducts.isEmpty
                      ? const FavoriteEmptyState()
                      : FavoriteListView(products: favoriteProducts),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}