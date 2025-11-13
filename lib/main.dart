import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Mate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 83, 94, 245),
      ),
      home: const SplashScreen(),
    );
  }
}
