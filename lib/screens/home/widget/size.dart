import 'package:fakestoreapi_using_http/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SizeCircleList extends StatefulWidget {
  const SizeCircleList({super.key});

  @override
  State<SizeCircleList> createState() => _SizeCircleListState();
}

class _SizeCircleListState extends State<SizeCircleList> {
  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          sizes.map((size) {
            final isSelected = size == selectedSize;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSize = size;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.appyellow : AppColors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white),
                ),
                alignment: Alignment.center,
                child: Text(
                  size,
                  style: TextStyle(
                    color: isSelected ?AppColors.black:AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
