import 'package:flutter/material.dart';

class GridMenuItem extends StatelessWidget {
  final String iconUrl;
  final String label;

  const GridMenuItem({super.key, required this.iconUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(iconUrl, height: 32, width: 32),
          const SizedBox(height: 6),
          Text(label,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }
}
