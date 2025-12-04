import 'package:flutter/material.dart';
import 'package:on_dock/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
  'assets/images/OnDock.png',
  width: 150,
  height: 150,
  fit: BoxFit.contain,
  errorBuilder: (context, error, stackTrace) {
    // Print the actual error to console
    debugPrint('❌ Image Error: $error');
    debugPrint('📍 StackTrace: $stackTrace');
    
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(
        Icons.apps,
        size: 80,
        color: Color(0xFF2196F3),
      ),
    );
  },
),
           
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}