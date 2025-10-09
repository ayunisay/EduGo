import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/custom_bottom_nav_bar.dart';


class HomePage extends StatelessWidget {
  final int selectedIndex;
  const HomePage({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                // Header Profil
                const Padding(
                  padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white12,
                        child: Icon(Icons.person, color: Colors.grey),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Ayo belajar, Baskara!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                // Kotak Kosong Besar
                Container(
                  height: 150,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                // Pomodoro Timer dan Shortcut
                      const PomodoroTimer(),
                //Shortcut button
                const SnapButton(),

                // Kalender Penuh dan Task Mini
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: const Text(
                      'Calendar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(flex: 3, child: FullCalendar()),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          MiniTaskCard(
                              text: 'Lakuin apaan brok??',
                              color: const Color(0xFFFCD04E),
                              date: '28 Juni 2025'),
                          MiniTaskCard(
                              text: 'Lakuin apaan brok??',
                              color: primaryColor,
                              date: '29 Juni 2025'),
                          MiniTaskCard(
                              text: 'Lakuin apaan brok??',
                              color: const Color(0xFFD9534F),
                              date: '30 Juni 2025'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex),
    );
  }
}

// Widget Pomodoro Timer
class PomodoroTimer extends StatelessWidget {
  const PomodoroTimer({super.key});

  // Tombol samping
  Widget _buildSideButton(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: primaryColor),
      ),
      child: Text(
        text,
        style: const TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timer Utama
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    const Text(
                      '30:00',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // Tombol Samping dan Shortcut
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSideButton('Pomodoro'),
              _buildSideButton('Short Break'),
              _buildSideButton('Long Break'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}

class SnapButton extends StatelessWidget {
  const SnapButton({super.key});

  // Tombol Shortcut Aplikasi
  Widget _buildShortcutButton(String text, IconData icon) {
    return Expanded(
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(right: 5.0, left: 5.0),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildShortcutButton('To-Do List', Icons.list_alt),
        _buildShortcutButton('Notes', Icons.event_note),
      ],
    );
  }
}


// Widget Kalender Penuh
class FullCalendar extends StatelessWidget {
  const FullCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> days = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
    // Simulasi tanggal (5 baris x 7 kolom)
    const List<int?> dates = [
      1, 2, 3, 4, 5, 6, 7,
      8, 9, 10, 11, 12, 13, 14,
      15, 16, 17, 18, 19, 20, 21,
      22, 23, 24, 25, 26, 27, 28,
      29, 30, null, null, null, null, null
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: days
              .map((day) => Text(day,
              style: const TextStyle(fontWeight: FontWeight.bold)))
              .toList(),
        ),
        const Divider(height: 10),
        SizedBox(
          height: 200, // Memberi batas tinggi untuk grid
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0,
            ),
            itemCount: dates.length,
            itemBuilder: (context, index) {
              final date = dates[index];
              if (date == null) return Container();

              bool today = date == 10;
              bool task = date == 29;

              return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (today)
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    Text(
                      date.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: today ? Colors.white : Colors.black,
                      ),
                    ),
                    if (task)
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Widget Kartu Task Mini (untuk samping kalender)
class MiniTaskCard extends StatelessWidget {
  final String text;
  final Color color;
  final String date;

  const MiniTaskCard({
    super.key,
    required this.text,
    required this.color,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border(left: BorderSide(color: color, width: 4)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 2),
          Text(date, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}