import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const SummaryRow({super.key, required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF64748b), fontSize: 13)),
        Text(value, style: TextStyle(fontWeight: FontWeight.w500, color: valueColor ?? const Color(0xFF0f172a))),
      ],
    );
  }
}