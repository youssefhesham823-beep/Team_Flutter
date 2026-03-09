import 'package:e_commerce_app/features/cart/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/widgets/empty_cart.dart';
import 'package:e_commerce_app/features/cart/widgets/cart_item_widget.dart';
import 'package:e_commerce_app/features/cart/widgets/order_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 900;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            sliver: SliverToBoxAdapter(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartUpdated) {
                    final items = state.items;
                    final cubit = context.read<CartCubit>();

                    if (items.isEmpty) return const EmptyCart();

                    return Column(
                      children: [
                        _buildHeader(cubit),
                        const SizedBox(height: 24),
                        if (isLargeScreen)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 2, child: _buildProductList(items)),
                              const SizedBox(width: 32),
                              Expanded(flex: 1, child: OrderSummary()),
                            ],
                          )
                        else
                          Column(
                            children: [
                              _buildProductList(items),
                              const SizedBox(height: 24),
                              OrderSummary(),
                            ],
                          ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Shopping Cart',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      actions: [
        _buildSortMenu(context),
        _buildClearCartButton(context),
      ],
    );
  }

  Widget _buildSortMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.sort),
      onSelected: (value) {
        final cubit = context.read<CartCubit>();
        switch (value) {
          case 'price_asc': cubit.sortByPrice(); break;
          case 'price_desc': cubit.sortByPrice(ascending: false); break;
          case 'name_asc': cubit.sortByName(); break;
          case 'name_desc': cubit.sortByName(ascending: false); break;
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'price_asc', child: Text('Price: Low to High')),
        PopupMenuItem(value: 'price_desc', child: Text('Price: High to Low')),
        PopupMenuItem(value: 'name_asc', child: Text('Name: A to Z')),
        PopupMenuItem(value: 'name_desc', child: Text('Name: Z to A')),
      ],
    );
  }

  Widget _buildClearCartButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_sweep),
      onPressed: () {
        context.read<CartCubit>().clearCart();
      },
    );
  }

  Widget _buildHeader(CartCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'You have ${cubit.totalItems} ${cubit.totalItems == 1 ? 'item' : 'items'} in your cart',
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF0b50da).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('Total: \$${cubit.total.toStringAsFixed(2)}'),
        ),
      ],
    );
  }

  Widget _buildProductList(List<CartItem> items) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) => CartItemWidget(item: items[index], index: index),
    );
  }
}