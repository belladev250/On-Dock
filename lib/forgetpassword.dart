import 'package:flutter/material.dart';
import 'constants/colors.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendResetLink() {
    if (_emailController.text.isNotEmpty) {
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                
                // Title
                const Text(
                  "Reset Your Password",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkPurple,
                    fontFamily: "PlusJakartaSans",
                    height: 1.2,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Subtitle
                const Text(
                  "Enter your registered email address and we'll send you instructions to reset your password.",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.mediumGrey,
                    fontFamily: "PlusJakartaSans",
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Email Address Label
                const Text(
                  "Email Address",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGrey,
                    fontFamily: "PlusJakartaSans",
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Email Input Field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter your email address",
                      hintStyle: TextStyle(
                        color: AppColors.mediumGrey,
                        fontFamily: "PlusJakartaSans",
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    style: const TextStyle(
                      color: AppColors.darkGrey,
                      fontFamily: "PlusJakartaSans",
                      fontSize: 15,
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Send Reset Link Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _sendResetLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Send Reset Link",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "PlusJakartaSans",
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Sign In Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Remember your password? ",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.mediumGrey,
                        fontFamily: "PlusJakartaSans",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate back to sign in
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.purple,
                          fontWeight: FontWeight.w600,
                          fontFamily: "PlusJakartaSans",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}