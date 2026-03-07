
import 'package:flutter/material.dart';

class FavoriteEmptyState extends StatelessWidget {
  const FavoriteEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Icon(Icons.favorite_border, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          const Text(
            'Your wishlist is empty',
            style: TextStyle(fontSize: 18, color: Color(0xFF64748B), fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}