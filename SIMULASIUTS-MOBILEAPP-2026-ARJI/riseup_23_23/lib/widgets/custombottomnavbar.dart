import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDisabledIcon(Icons.home_outlined),
          _buildDisabledIcon(Icons.bar_chart_outlined),
          _buildCenterItem(
            Icons.restaurant_outlined,
            2,
          ), // Index 2: Only clickable one
          _buildDisabledIcon(Icons.local_fire_department_outlined),
          _buildDisabledIcon(Icons.emoji_events_outlined),
        ],
      ),
    );
  }

  Widget _buildDisabledIcon(IconData icon) {
    return Icon(icon, size: 28, color: Colors.black);
  }

  Widget _buildCenterItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Color(0xFFD1C4E9), // The light purple from your image
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}
