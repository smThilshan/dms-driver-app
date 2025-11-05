import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final bool isOnline;

  const StatusIndicator({super.key, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    final color = isOnline ? Colors.green : Colors.red;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 12,
            spreadRadius: 3,
          ),
        ],
      ),
      child: const Icon(Icons.check, color: Colors.white, size: 100),
    );
  }
}
