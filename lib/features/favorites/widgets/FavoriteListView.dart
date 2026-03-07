import 'package:e_commerce_app/features/favorites/widgets/FavoriteCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/favorites/ui/cubit/favorites_cubit.dart';

class FavoriteListView extends StatelessWidget {
  final List<ProductModel> products;
  const FavoriteListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double aspectRatio = (screenWidth / 2) / 330; 

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: aspectRatio, 
          ),
          itemBuilder: (context, index) {
            return FavoriteCard(
              product: products[index],
              onRemove: () {
                context.read<FavoritesCubit>().toggleFavorite(products[index]);
              },
            );
          },
        );
      },
    );
  }
}