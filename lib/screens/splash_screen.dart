import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoAnim;

  @override
  void initState() {
    super.initState();
    _logoController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _logoAnim = CurvedAnimation(parent: _logoController, curve: Curves.easeOut);
    _logoController.forward();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // simple splash with centered text
      body: Container(
        color: Colors.white,
        child: Center(
          child: ScaleTransition(
            scale: _logoAnim,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.account_balance_wallet_rounded, size: 72, color: Colors.blue),
                SizedBox(height: 12),
                Text('Finance Mate', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
