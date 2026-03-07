import 'package:e_commerce_app/core/widgets/app_header.dart';
import 'package:e_commerce_app/core/widgets/search_widget.dart';
import 'package:e_commerce_app/features/favorites/widgets/FavoriteHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/favorites/ui/cubit/favorites_cubit.dart';
import 'package:e_commerce_app/features/favorites/ui/cubit/favorites_state.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/favorites/widgets/FavoriteEmpty.dart';
import 'package:e_commerce_app/features/favorites/widgets/FavoriteListView.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            List<ProductModel> favoriteProducts = [];
            if (state is FavoritesUpdated) {
              favoriteProducts = context
                  .read<FavoritesCubit>()
                  .searchFavorites(_searchQuery);
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppHeader(),
                  const SizedBox(height: 3),
                  FavoriteHeader(count: favoriteProducts.length),
                  const SizedBox(height: 16),
                  SearchWidget(
                    onChanged: (query) {
                      setState(() {
                        _searchQuery = query;
                      });
                    },
                  ),
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