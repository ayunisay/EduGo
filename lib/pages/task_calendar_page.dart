import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/custom_bottom_nav_bar.dart';

// Widget Kartu Task Status
class TaskCategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  final Widget? pattern;

  const TaskCategoryCard({
    super.key,
    required this.title,
    required this.color,
    this.pattern,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          if (pattern != null)
            Positioned(
              right: -10,
              bottom: -10,
              child: Opacity(opacity: 0.2, child: pattern!),
            ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Kartu Task di List
class TaskListItem extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;
  final String date;

  const TaskListItem({
    super.key,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEA), // Warna kuning/oranye muda untuk kartu
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TaskCalendarPage extends StatelessWidget {
  final int selectedIndex;
  const TaskCalendarPage({super.key, required this.selectedIndex});

  // Data dummy kategori
  final List<Map<String, dynamic>> categories = const [
    {
      'title': 'On Going',
      'color': secondaryColor,
      'pattern': Icon(Icons.code, color: Colors.white, size: 50),
    },
    {
      'title': 'On Process',
      'color': Color(0xFFFCD04E),
      'pattern': Icon(Icons.schedule, color: Colors.white, size: 50),
    },
    {
      'title': 'Done',
      'color': Color(0xFF5cb85c),
      'pattern': Icon(Icons.check, color: Colors.white, size: 50),
    },
    {
      'title': 'Cancel',
      'color': Color(0xFFD9534F),
      'pattern': Icon(Icons.close, color: Colors.white, size: 50),
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Data task list
    final List<Map<String, dynamic>> tasks = [
      {
        'title': 'Lakuin apaan brok??',
        'status': 'On Process',
        'color': const Color(0xFFFCD04E),
        'date': '28 Juni 2025'
      },
      {
        'title': 'Lakuin apaan brok??',
        'status': 'On Process',
        'color': const Color(0xFFFCD04E),
        'date': '28 Juni 2025'
      },
      {
        'title': 'Lakuin apaan brok??',
        'status': 'On Going',
        'color': primaryColor, // Menggunakan primaryColor untuk On Going
        'date': '28 Juni 2025'
      },
    ];

    // Data kalender mini
    const List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    const List<String> dates = ['22', '23', '24', '25', '26', '27', '28'];

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            const CustomSearchBar(placeholder: 'Search task'),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  // Grid Kategori Task
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 2.5,
                    children: categories
                        .map((e) => TaskCategoryCard(
                      title: e['title'],
                      color: e['color'],
                      pattern: e['pattern'],
                    ))
                        .toList(),
                  ),
                  const SizedBox(height: 20),

                  // Header "Task For Today!"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Task For Today!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 30, // Mengatur tinggi agar terlihat seperti kapsul kecil
                        child: CustomFab(
                          text: 'Add new task',
                          icon: Icons.add,
                          onPressed: () {},
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Kalender Mini
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(7, (index) {
                      bool isSelected = index == 6; // Tanggal 28 (index 6)
                      return Column(
                        children: [
                          Text(
                            days[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? secondaryColor : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: isSelected
                                ? BoxDecoration(
                              color: primaryColor.withOpacity(0.5),
                              shape: BoxShape.circle,
                            )
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              dates[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? secondaryColor : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 20),

                  // Daftar Task Card
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return TaskListItem(
                        title: task['title']!,
                        status: task['status']!,
                        statusColor: task['color'] as Color,
                        date: task['date']!,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex),
    );
  }
}