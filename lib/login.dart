import 'package:flutter/material.dart';
import 'package:on_dock/register.dart';
import 'constants/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    // Handle sign in logic
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      // Show error
      return;
    }
    // Perform sign in
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
                "Welcome back",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkPurple,
                  fontFamily: "PlusJakartaSans",
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Subtitle
              const Text(
                "Access your dashboard, monitor docks, and connect instantly with nearby warriors.",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGrey,
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
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                  fontFamily: "PlusJakartaSans",
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Email Text Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: TextStyle(
                      color: AppColors.mediumGrey,
                      fontFamily: "PlusJakartaSans",
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                  style: const TextStyle(
                    color: AppColors.darkGrey,
                    fontFamily: "PlusJakartaSans",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Password Label
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                  fontFamily: "PlusJakartaSans",
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Password Hint
              const Text(
                "Enter a secure password",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.mediumGrey,
                  fontFamily: "PlusJakartaSans",
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Password Text Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                 
                ),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(
                      color: AppColors.mediumGrey,
                      fontFamily: "PlusJakartaSans",
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.mediumGrey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(
                    color: AppColors.darkGrey,
                    fontFamily: "PlusJakartaSans",
                  ),
                  obscureText: _obscureText,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Forgot Password Link - BELOW the password field
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Handle forgot password
                  },
                  child: const Text(
                    "FORGET PASSWORD?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.purple,
                      fontFamily: "PlusJakartaSans",
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _signIn,
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
                    "Sign In",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "PlusJakartaSans",
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Horizontal Divider - BELOW the button
              const Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColors.lightGrey),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "OR USE",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.mediumGrey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "PlusJakartaSans",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: AppColors.lightGrey),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // Social Media Buttons 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton("assets/icons/google.png", "Google"),
                  const SizedBox(width: 30),
                  _buildSocialButton("assets/icons/apple.png", "Apple"),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // Sign Up Link
              Center(
                child: GestureDetector(
                  onTap: () {
             
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "New here? ",
                      style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 16,
                        fontFamily: "PlusJakartaSans",
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: AppColors.purple,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            fontFamily: "PlusJakartaSans",
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
    );
  }

  // Social button widget
  Widget _buildSocialButton(String imagePath, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              width: 28,
              height: 28,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.darkGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
      ],
    );
  }
}