import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class NotesEmptyPage extends StatelessWidget {
  final int selectedIndex;
  const NotesEmptyPage({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            const CustomSearchBar(placeholder: 'Search task'),
            // Konten kosong di tengah
            const Expanded(child: Center(
              // Di sini dapat ditambahkan ilustrasi jika diinginkan, namun gambar menunjukkan area kosong
            )),
          ],
        ),
      ),
      // Tombol 'Add new note'
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 520.0, right: 8.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: CustomFab(
            text: 'Add new note',
            icon: Icons.add,
            onPressed: () {
              // Aksi tambah catatan
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex),
    );
  }
}