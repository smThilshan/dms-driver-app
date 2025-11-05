import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final String value;
  final bool obscure;
  final bool borderHighlight;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.value,
    this.obscure = false,
    this.borderHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: borderHighlight
                    ? Colors.blueAccent
                    : Colors.grey.shade300,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            width: double.infinity,
            child: Text(
              obscure ? "**********" : value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
