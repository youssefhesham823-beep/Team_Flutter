import 'package:flutter/material.dart';

class FavoriteHeader extends StatelessWidget {
  final int count;
  const FavoriteHeader({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0F172A), size: 22),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 8), 
            const Text(
              'Your Favorites',
              style: TextStyle(
                fontSize: 26, 
                fontWeight: FontWeight.w900, 
                color: Color(0xFF0F172A),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Color(0xFF64748B), 
                fontSize: 16,
              ),
              children: [
                const TextSpan(text: 'You have '),
                TextSpan(
                  text: '$count items ',
                  style: const TextStyle(
                    color: Color(0xFF0B50DA), 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: 'saved in your wishlist.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}