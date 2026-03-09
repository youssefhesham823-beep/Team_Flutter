import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';

class PromoCodeField extends StatelessWidget {
  const PromoCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Promo Code',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF64748b), letterSpacing: 0.5),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter code',
                  filled: true,
                  fillColor: const Color(0xFFf1f5f9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context.read<CartCubit>().applyPromoCode(value);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Promo code "$value" applied!')),
                    );
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFe2e8f0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Apply', style: TextStyle(fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ],
    );
  }
}