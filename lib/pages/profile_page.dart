import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'threads_page.dart'; // Import ThreadCard

class ProfilePage extends StatefulWidget {
  final int selectedIndex;
  const ProfilePage({super.key, required this.selectedIndex});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Widget kustom untuk Tab Bar yang mereplikasi visual
  Widget _buildCustomTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: lightGrey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          _buildCustomTab(0, 'Threads Up', _tabController.index == 0),
          _buildCustomTab(1, 'Notes', _tabController.index == 1),
        ],
      ),
    );
  }

  Widget _buildCustomTab(int index, String text, bool isSelected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _tabController.index = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: primaryColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? secondaryColor : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk konten tab
    final List<Map<String, String>> profileThreads = [
      {
        'avatar': 'B',
        'title': 'Materi Kelas 9, Bahasa Indonesia, Matematika, Fisika, dan Biologi.',
        'content': 'Pendidikan adalah paspor menuju masa depan, dan hari esok adalah milik mereka yang mempersiapkannya hari ini. Mari terus berinvestasi pada ilmu pengetahuan, karena itu adalah bekal terbaik untuk diri kita dan generasi mendatang. 🎓✨',
      },
    ];

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            // Header Profil
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                children: [
                  // Avatar Besar
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: lightGrey,
                    // Menggunakan placeholder visual untuk gambar profil
                    child: ClipOval(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey, // Warna solid sebagai placeholder
                        child: const Center(child: Text('B', style: TextStyle(fontSize: 40, color: Colors.white))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Nama dan Ikon Edit
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Baskara',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.edit, color: Colors.grey[700], size: 20),
                    ],
                  ),
                ],
              ),
            ),
            // Tab Bar Kustom
            _buildCustomTabBar(),
            const SizedBox(height: 16),
            // Konten Tab
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Tab 'Threads Up'
                  ListView.builder(
                    itemCount: profileThreads.length,
                    itemBuilder: (context, index) {
                      final thread = profileThreads[index];
                      // Gunakan visual replikasi ThreadCard
                      return ThreadCard(
                        avatarText: thread['avatar']!,
                        title: thread['title']!,
                        content: thread['content']!,
                      );
                    },
                  ),
                  // Tab 'Notes' (Dapat diisi dengan daftar notes kosong/placeholder)
                  const Center(child: Text('Notes kosong.')),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: widget.selectedIndex),
    );
  }
}