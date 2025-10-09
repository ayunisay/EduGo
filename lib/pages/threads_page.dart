import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/custom_bottom_nav_bar.dart';

// Widget kartu thread
class ThreadCard extends StatelessWidget {
  final String avatarText;
  final String title;
  final String content;

  const ThreadCard({
    super.key,
    required this.avatarText,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar Placeholder
          CircleAvatar(
            backgroundColor: lightGrey,
            radius: 20,
            child: Text(avatarText),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(content),
                const SizedBox(height: 8),
                // Ikon Interaksi
                const Row(
                  children: [
                    Icon(Icons.favorite_border, size: 18),
                    SizedBox(width: 16),
                    Icon(Icons.comment_outlined, size: 18),
                    SizedBox(width: 16),
                    Icon(Icons.share_outlined, size: 18),
                    Spacer(),
                    Icon(Icons.bookmark_border, size: 18),
                  ],
                ),
                const Divider(), // Garis pemisah antar post
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThreadsPage extends StatelessWidget {
  final int selectedIndex;
  const ThreadsPage({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk threads
    final List<Map<String, String>> threads = [
      {
        'avatar': 'S',
        'title': 'Materi Kelas 9, Bahasa Indonesia, Matematika, Fisika, dan Biologi.',
        'content': 'Setiap halaman yang kita baca adalah langkah menuju versi terbaik dari diri kita. Jangan pernah berhenti belajar, karena kita tidak pernah selesai mengajarkan. Mari terus bertumbuh dan raih impianmu! 🌟',
      },
      {
        'avatar': 'E',
        'title': 'Pendidikan adalah paspor menuju masa depan',
        'content': 'Pendidikan adalah paspor menuju masa depan, dan hari esok adalah milik mereka yang mempersiapkannya hari ini. Mari terus berinvestasi pada ilmu pengetahuan, karena itu adalah bekal terbaik untuk diri kita dan generasi mendatang. 🎓✨',
      },
      // ... ulangi data untuk mengisi tampilan seperti di gambar
    ];

    // Menggandakan data agar ListView terlihat penuh
    final duplicatedThreads = [...threads, ...threads, ...threads];

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            const CustomSearchBar(placeholder: 'Search threads'),
            Expanded(
              child: ListView.builder(
                itemCount: duplicatedThreads.length,
                itemBuilder: (context, index) {
                  final thread = duplicatedThreads[index];
                  return ThreadCard(
                    avatarText: thread['avatar']!,
                    title: thread['title']!,
                    content: thread['content']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // FAB "Create threads" di tengah bawah
      floatingActionButton: CustomFab(
        text: 'Create threads',
        icon: Icons.add,
        onPressed: () {},
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex),
    );
  }
}