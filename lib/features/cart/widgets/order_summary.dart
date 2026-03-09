import 'package:e_commerce_app/features/cart/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/widgets/summary_row.dart';
import 'package:e_commerce_app/features/cart/widgets/promo_code_field.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartUpdated) {
          final cubit = context.read<CartCubit>();

          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFe2e8f0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                SummaryRow(label: 'Subtotal', value: '\$${cubit.subtotal.toStringAsFixed(2)}'),
                const SizedBox(height: 10),
                const SummaryRow(label: 'Shipping estimate', value: 'Free', valueColor: Colors.green),
                const SizedBox(height: 10),
                SummaryRow(label: 'Tax estimate', value: '\$${cubit.tax.toStringAsFixed(2)}'),
                const SizedBox(height: 20),
                const PromoCodeField(),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 16),
                _buildTotalRow(cubit),
                const SizedBox(height: 20),
                _buildCheckoutButton(context),
                const SizedBox(height: 12),
                _buildSecureCheckout(),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildTotalRow(CartCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Order Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        Text('\$${cubit.total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildCheckoutButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: colorScheme.primary.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Proceeding to checkout...')),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Proceed to Checkout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecureCheckout() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.lock_outline, size: 14, color: Color(0xFF94a3b8)),
        SizedBox(width: 4),
        Text('Secure Checkout', style: TextStyle(fontSize: 12, color: Color(0xFF94a3b8))),
      ],
    );
  }
}