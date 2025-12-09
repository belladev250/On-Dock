import 'package:flutter/material.dart';
import 'constants/colors.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:AppColors.bgColor,
    );
  }
}