import 'package:flutter/material.dart';
import 'package:on_dock/splash_screen.dart';  
import 'package:on_dock/home_screen.dart';    
import 'register.dart';
import 'login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'onDock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PlusJakartaSans'
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
       '/signin': (context) => const Login(),
       '/signup': (context) => const Register(),
   
      },
    );
  }
}