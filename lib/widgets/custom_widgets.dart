import 'package:flutter/material.dart';
import '../main.dart'; // Import untuk warna

// Simulasi Status Bar
class CustomStatusBar extends StatelessWidget {
  const CustomStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: backgroundColor,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '21.00',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Row(
            children: [
              Icon(Icons.wifi, size: 18),
              SizedBox(width: 4),
              Text(
                '80%',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(width: 4),
              Icon(Icons.battery_full, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Search Bar
class CustomSearchBar extends StatelessWidget {
  final String placeholder;
  final Color backgroundColor;

  const CustomSearchBar({
    super.key,
    required this.placeholder,
    this.backgroundColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50.0), // Bentuk kapsul
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: secondaryColor),
          hintText: placeholder,
          hintStyle: const TextStyle(color: secondaryColor),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

// Custom FAB (Floating Action Button) berbentuk kapsul
class CustomFab extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const CustomFab({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: color,
      foregroundColor: secondaryColor,
      label: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), // Bentuk kapsul
      ),
      elevation: 4.0,
    );
  }
}