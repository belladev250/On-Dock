import 'package:flutter/material.dart';
import 'package:on_dock/constants/colors.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  void _sendVerificationCode() {
    // Handle sending verification code
    print('Sending verification code...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              
              // Title
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
              
              // Description
              const Text(
                "To continue, please verify your email. The verification code is to be sent to your registered email address.",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGrey,
                  fontFamily: "PlusJakartaSans",
                  height: 1.5,
                ),
              ),
              
              const SizedBox(height: 50),
              
              // Send Verification Code Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _sendVerificationCode,
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
                    "Send Verification Code",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "PlusJakartaSans",
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}