import 'package:e_commerce_app/features/favorites/ui/cubit/favorites_cubit.dart';
import 'package:e_commerce_app/features/favorites/widgets/FavoriteCard.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListView extends StatelessWidget {
  final List<ProductModel> products;
  const FavoriteListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          product: products[index],
          onRemove: () {
            context.read<FavoritesCubit>().toggleFavorite(products[index]);
          },
        );
      },
    );
  }
}
