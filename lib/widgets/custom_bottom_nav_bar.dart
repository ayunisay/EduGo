import 'package:flutter/material.dart';
import '../main.dart'; // Import untuk warna

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({super.key, required this.selectedIndex});

  // Fungsi untuk mendapatkan background dekorasi ikon
  BoxDecoration _getIconDecoration(int index) {
    return index == selectedIndex
        ? BoxDecoration(
      color: selectedIconBg,
      borderRadius: BorderRadius.circular(50),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2),
        ),
      ],
    )
        : const BoxDecoration();
  }

  // Fungsi navigasi
  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/tasks');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/threads');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/notes_empty');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home_outlined,
      Icons.list_alt,
      Icons.chat_bubble_outline,
      Icons.event_note_outlined, // Menggunakan ikon notes/memo untuk kalender
      Icons.person_outline,
    ];

    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 16.0, left: 24.0, right: 24.0),
      decoration: BoxDecoration(
        color: lightGrey.withOpacity(0.9),
        borderRadius: BorderRadius.circular(50.0), // Bentuk kapsul
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          return InkWell(
            onTap: () => _onItemTapped(context, index),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: _getIconDecoration(index),
              child: Icon(
                icons[index],
                color: secondaryColor,
                size: 24,
              ),
            ),
          );
        }),
      ),
    );
  }
}