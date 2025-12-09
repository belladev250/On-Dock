import 'dart:async';
import 'package:flutter/material.dart';
import 'constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  
  Timer? _timer;

  final List<OnboardingData> pages = [
    OnboardingData(
      iconPath: "assets/icons/OnDock Icon_dock light monitor.png",
      title: 'Dock Light Monitoring',
      color: AppColors.grey,
    ),
    OnboardingData(
      iconPath: "assets/icons/OnDock Icon_message.png",
      title: 'Anonymous Chat',
      color: AppColors.grey,
    ),
    OnboardingData(
      iconPath: "assets/icons/OnDock Icon_clock.png",
      title: 'Road View Update',
      color: AppColors.grey,
    ),
    OnboardingData(
      iconPath: "assets/icons/OnDock Icon_map.png",
      title: 'Map Based Post',
      color: AppColors.grey,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSwipe();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoSwipe() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        if (_currentPage < pages.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: GestureDetector(
        // Allow manual swiping with gestures
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            // Swiped right (go to previous)
            setState(() {
              if (_currentPage > 0) {
                _currentPage--;
              } else {
                _currentPage = pages.length - 1;
              }
            });
          } else if (details.primaryVelocity! < 0) {
            // Swiped left (go to next)
            setState(() {
              if (_currentPage < pages.length - 1) {
                _currentPage++;
              } else {
                _currentPage = 0;
              }
            });
          }
        },
        child: Stack(
          children: [
            // Fading icon in the center
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: SizedBox(
                  key: ValueKey<int>(_currentPage),
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    pages[_currentPage].iconPath,
                    width: 300,
                    height: 300,
                    // ignore: deprecated_member_use
                    color: pages[_currentPage].color.withOpacity(0.5),
                  ),
                ),
              ),
            ),

          // Fixed dots near bottom
          Positioned(
            bottom: 180,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => _buildDot(index),
              ),
            ),
          ),

          // Fading text below dots
          Positioned(
            bottom: 130,
            left: 20,
            right: 20,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Text(
                pages[_currentPage].title,
                key: ValueKey<int>(_currentPage),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Sign Up and Sign In buttons at the bottom
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              children: [
                // Sign Up button
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        _timer?.cancel(); 
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.light,
                        foregroundColor: AppColors.purple,
                        elevation: 0,
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Sign In button
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        _timer?.cancel();
                        Navigator.pushNamed(context, '/signin');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purple,
                        foregroundColor: AppColors.light,
                        elevation: 0,
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }

  // Build page indicator dot
  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.purple : AppColors.light,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// Data model for each onboarding page
class OnboardingData {
  final String iconPath;
  final String title;
  final Color color;

  OnboardingData({
    required this.iconPath,
    required this.title,
    required this.color,
  });
}