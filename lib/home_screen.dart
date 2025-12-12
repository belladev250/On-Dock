import 'dart:async';
import 'package:flutter/material.dart';
import 'constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _currentPage = 0;
  Timer? _timer;
  AnimationController? _fillController;
  Animation<double>? _fillAnimation;

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
    _fillController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    
    _fillAnimation = CurvedAnimation(
      parent: _fillController!,
      curve: Curves.easeInOut,
    );
    
    _fillController!.forward();
    _startAutoSwipe();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _fillController?.dispose();
    super.dispose();
  }

  void _startAutoSwipe() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _changePage((_currentPage + 1) % pages.length);
    });
  }

  void _changePage(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
    _fillController?.reset();
    _fillController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            _changePage(_currentPage > 0 ? _currentPage - 1 : pages.length - 1);
          } else if (details.primaryVelocity! < 0) {
            _changePage(_currentPage < pages.length - 1 ? _currentPage + 1 : 0);
          }
        },
        child: Stack(
          children: [
            // Animated icon with fill effect
            Positioned(
              top: 230,
              left: 0,
              right: 0,
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
                  child: _fillAnimation != null
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            // Base icon (gray/dark)
                            Image.asset(
                              pages[_currentPage].iconPath,
                              width: 300,
                              height: 300,
                              color: pages[_currentPage].color.withOpacity(0.3),
                            ),
                            // Filling purple icon with clip animation
                            AnimatedBuilder(
                              animation: _fillAnimation!,
                              builder: (context, child) {
                                return ClipRect(
                                  clipper: _FillClipper(_fillAnimation!.value),
                                  child: Image.asset(
                                    pages[_currentPage].iconPath,
                                    width: 300,
                                    height: 300,
                                    color: AppColors.purple,
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      : Image.asset(
                          pages[_currentPage].iconPath,
                          width: 300,
                          height: 300,
                          color: pages[_currentPage].color.withOpacity(0.5),
                        ),
                ),
              ),
            ),

            // Fixed dots near bottom
            Positioned(
              bottom: 230,
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
              bottom: 150,
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
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PlusJakartaSans",
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
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: "PlusJakartaSans",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
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
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: "PlusJakartaSans",
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

// Custom clipper for the fill animation effect
class _FillClipper extends CustomClipper<Rect> {
  final double progress;

  _FillClipper(this.progress);

  @override
  Rect getClip(Size size) {
    // Fill from bottom to top
    return Rect.fromLTRB(
      0,
      size.height * (1 - progress),
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(_FillClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}

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