import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const Youcef48App());
}

class Youcef48App extends StatelessWidget {
  const Youcef48App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youcef48 Wallpapers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
