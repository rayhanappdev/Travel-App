import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const TravelApp());

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',

      // ১. Light Mode (Sada Theme)
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),

      // ২. Dark Mode (Kalo/Premium Theme)
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212), // Deep Dark
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
        ),
      ),

      // ৩. Phone-er settings onujayi auto change hobe
      themeMode: ThemeMode.system,

      home: const HomeScreen(),
    );
  }
}