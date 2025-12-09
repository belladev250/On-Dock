import 'package:flutter/material.dart';
import 'package:on_dock/login.dart';
import 'package:on_dock/verify_email.dart';
import 'constants/colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  bool _obscureConfirmText = true;

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
                "Sign Up",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                   color: AppColors.darkPurple,
                  fontFamily: "PlusJakartaSans",
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Subtitle
              const Text(
                "Join the smarter way to stay connected on the road today.",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGrey,
                  fontFamily: "PlusJakartaSans",
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Email Address Label
              Text(
                "Email Address",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
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
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  style: TextStyle(color: Colors.grey[800]),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Password Label
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
              ),
              
              const SizedBox(height: 4),
              
             
              
              const SizedBox(height: 8),
              
              // Password Text Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
        
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey[500],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: Colors.grey[800]),
                  obscureText: _obscureText,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Confirm Password Label
              Text(
                "Confirm Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
              ),
              
              const SizedBox(height: 4),
              
             
              
              // Confirm Password Text Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                 
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Confirm your password",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey[500],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmText = !_obscureConfirmText;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: Colors.grey[800]),
                  obscureText: _obscureConfirmText,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Horizontal Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey[300]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "OR USE",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey[300]),
                  ),
                ],
              ),
              
              const SizedBox(height: 10),
              
              // Social Media Buttons
         Row(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
        _buildSocialButton("assets/icons/google.png","google"),
        const SizedBox(width: 20),
       _buildSocialButton("assets/icons/apple.png","apple"),
  ],
),

              const SizedBox(height: 40),
              
              // Sign Up Button
            SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerifyEmail(), // your page here
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.purple,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
    ),
    child: const Text(
      "Sign Up",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
),

              
              const SizedBox(height: 24),
              
              // Sign In Link
            Center(
  child: RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "Already have an account? ",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
        ),
        WidgetSpan(
          child: GestureDetector(
            onTap: () {
              // Navigate to Login screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: const Text(
              "Sign In",
              style: TextStyle(
                color: AppColors.purple,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
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

  
  Widget _buildSocialButton(String imagePath, String label) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
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
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ),
    ],
  );
}


}