import 'package:fakestoreapi_using_http/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MoodBanner extends StatelessWidget {
  const MoodBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
            children: [
              const TextSpan(
                text: 'IN THE ',
                style: TextStyle(color: AppColors.white),
              ),
              WidgetSpan(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 3,
                  ),
                  color: Colors.yellow,
                  child: const Text(
                    'MOOD',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const TextSpan(
                text: ' FOR',
                style: TextStyle(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
