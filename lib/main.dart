import 'package:crypto_dashboard_kit/pages/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: const TextStyle(color: Colors.white, fontSize: 60),
          bodyMedium: const TextStyle(color: Colors.white, fontSize: 25),
          bodySmall: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        cardColor: const Color(0xFF3E3D44),
        scaffoldBackgroundColor: const Color(0xFF252429),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}
