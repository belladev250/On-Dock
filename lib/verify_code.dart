import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:on_dock/constants/colors.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  List<TextEditingController> controllers = List.generate(5, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());
  bool _showSuccessPopup = false;
  
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i].addListener(() {});
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged(String value, int index) {
    if (value.isNotEmpty && index < 4) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
    
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
    
    bool allFilled = controllers.every((controller) => controller.text.isNotEmpty);
    if (allFilled) {
      _verifyEmail();
    }
  }

  void _verifyEmail() {
    controllers.map((c) => c.text).join();
    
    
    setState(() {
      _showSuccessPopup = true;
    });
  }

  void _resendCode() {
   
  }

  void _continueToApp() {
   
    Navigator.pushNamedAndRemoveUntil(context, '/about-you', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150),
                  
                  const Text(
                    "Verify Your Email",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkPurple,
                      fontFamily: "PlusJakartaSans",
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  RichText(
                    text: const TextSpan(
                      text: "We've sent a verification code to ",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.darkGrey,
                        fontFamily: "PlusJakartaSans",
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: "dock@test.com",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkPurple,
                          ),
                        ),
                        TextSpan(
                          text: ". Enter the code below to confirm your account.",
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 50),
                  
                  const Text(
                    "Verification Code",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkGrey,
                      fontFamily: "PlusJakartaSans",
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return Container(
                        width: 56,
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: TextField(
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkPurple,
                            fontFamily: "PlusJakartaSans",
                          ),
                          decoration: const InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          onChanged: (value) => _onCodeChanged(value, index),
                        ),
                      );
                    }),
                  ),
                  
                  const SizedBox(height: 50),
                  
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _verifyEmail,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Verify Email",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "PlusJakartaSans",
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  Center(
                    child: GestureDetector(
                      onTap: _resendCode,
                      child: RichText(
                        text: const TextSpan(
                          text: "Didn't receive the code? ",
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: 16,
                            fontFamily: "PlusJakartaSans",
                          ),
                          children: [
                            TextSpan(
                              text: "Resend",
                              style: TextStyle(
                                color: AppColors.purple,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: "PlusJakartaSans",
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // GLASSMORPHISM POPUP (matches your screenshot)
          if (_showSuccessPopup)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(0), // No padding, we'll add to inner content
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                           
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: AppColors.purple,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                size: 48,
                                color: AppColors.light,
                              ),
                            ),
                            
                            const SizedBox(height: 24),
                            
                            // Title
                            const Text(
                              "Email Verified\nSuccessfully!",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkPurple,
                                fontFamily: "PlusJakartaSans",
                              ),
                              textAlign: TextAlign.center,
                            ),
                            
                            const SizedBox(height: 24),
                     
                            
                           
                            
                            // Description text
                            const Text(
                              "Your account is now active. You can start monitoring docks, chatting with nearby warriors, and managing your trips.",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.darkGrey,
                                fontFamily: "PlusJakartaSans",
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            
                            const SizedBox(height: 32),
                            
                            // Continue Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _continueToApp,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.purple,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  "Continue",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "PlusJakartaSans",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}