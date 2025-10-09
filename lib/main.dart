import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/notes_empty_page.dart';
import 'pages/profile_page.dart';
import 'pages/task_calendar_page.dart';
import 'pages/threads_page.dart';

// Definisi Warna Dasar
const Color primaryColor = Color(0xFFA9D1D5);
const Color secondaryColor = Color(0xFF377D87);
const Color backgroundColor = Color(0xFFFFFFFF);
const Color lightGrey = Color(0xFFE0E0E0);
const Color selectedIconBg = Color(0xFFC0C0C0);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduGo!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        fontFamily: 'Roboto', // Ganti dengan font yang mirip jika perlu
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(selectedIndex: 0),
        '/tasks': (context) => const TaskCalendarPage(selectedIndex: 1),
        '/threads': (context) => const ThreadsPage(selectedIndex: 2),
        '/notes_empty': (context) => const NotesEmptyPage(selectedIndex: 3),
        '/profile': (context) => const ProfilePage(selectedIndex: 4),
      },
    );
  }
}