import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          const Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          const Text(
            'Browse our products and add items to your cart',
            style: TextStyle(color: Color(0xFF64748b)),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // رجوع للتصفح
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0b50da),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Continue Shopping', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
