import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_state.dart';
import 'package:e_commerce_app/features/cart/widgets/quantity_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final int index;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    final total = item.currentPrice * item.quantity;
    final product = item.product;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFe2e8f0)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(),
              
              const SizedBox(width: 12),
              
              Expanded(
                flex: 2,
                child: _buildProductDetails(product),
              ),
              
              const SizedBox(width: 12),
              
              _buildPriceColumn(product),
              
              const SizedBox(width: 16),
              
              _buildQuantityControl(context, cubit),
              
              const SizedBox(width: 16),
              
              _buildTotalColumn(total),
              
              const SizedBox(width: 8),
              
              _buildDeleteButton(context, cubit, product),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFf1f5f9),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          item.image, // استخدام getter الصورة الأولى
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: const Color(0xFFe2e8f0),
            child: const Icon(
              Icons.image_not_supported_outlined,
              size: 30,
              color: Color(0xFF94a3b8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF0f172a),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          'Brand: ${product.brand}', // استخدمنا brand بدل color
          style: const TextStyle(
            color: Color(0xFF64748b),
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        _buildStockStatus(),
        if (product.isOnSale && product.oldPrice != null) ...[
          const SizedBox(height: 4),
          _buildSaleBadge(product),
        ],
      ],
    );
  }

  Widget _buildStockStatus() {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline,
          size: 14,
          color: Colors.green[600],
        ),
        const SizedBox(width: 4),
        Text(
          item.stockStatus, // استخدام getter
          style: TextStyle(
            color: item.stockColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSaleBadge(ProductModel product) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'Sale ${((product.oldPrice! - product.price) / product.oldPrice! * 100).round()}% OFF',
        style: TextStyle(
          color: Colors.red.shade700,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPriceColumn(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Price',
          style: TextStyle(
            color: Color(0xFF64748b),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        if (product.isOnSale && product.oldPrice != null) ...[
          Text(
            '\$${product.oldPrice!.toStringAsFixed(2)}',
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Color(0xFF94a3b8),
              fontSize: 12,
            ),
          ),
        ],
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: product.isOnSale ? Colors.red.shade600 : const Color(0xFF0f172a),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityControl(BuildContext context, CartCubit cubit) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Qty',
          style: TextStyle(
            color: Color(0xFF64748b),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFcbd5e1)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              QuantityButton(
                icon: Icons.remove,
                onPressed: () {
                  if (item.quantity > 1) {
                    cubit.updateQuantity(index, item.quantity - 1);
                  }
                },
              ),
              Container(
                width: 32,
                alignment: Alignment.center,
                child: Text(
                  item.quantity.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF0f172a),
                  ),
                ),
              ),
              QuantityButton(
                icon: Icons.add,
                onPressed: () => cubit.updateQuantity(index, item.quantity + 1),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTotalColumn(double total) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Total',
          style: TextStyle(
            color: Color(0xFF64748b),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${total.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF0f172a),
          ),
        ),
      ],
    );
  }

  Widget _buildDeleteButton(BuildContext context, CartCubit cubit, ProductModel product) {
    return IconButton(
      onPressed: () {
        cubit.removeItem(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.name} removed from cart'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () => cubit.addItem(product),
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.delete_outline,
        color: Color(0xFF64748b),
        size: 22,
      ),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}