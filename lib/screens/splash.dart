import 'package:fakestoreapi_using_http/main.dart';
import 'package:fakestoreapi_using_http/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => ProductMain());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appyellow,
      body: Center(
        child: Text(
          "Shop Style",
          style: GoogleFonts.greatVibes(
            fontSize: 60,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.grey.shade400,
                offset: const Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
