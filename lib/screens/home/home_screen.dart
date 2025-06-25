import 'package:fakestoreapi_using_http/controller/product_controller.dart';
import 'package:fakestoreapi_using_http/screens/home/moodbanner.dart';
import 'package:fakestoreapi_using_http/screens/home/productlist.dart';
import 'package:fakestoreapi_using_http/screens/home/widget/product_circle.dart';
import 'package:fakestoreapi_using_http/screens/notification/notification.dart';
import 'package:fakestoreapi_using_http/utils/app_assets.dart';
import 'package:fakestoreapi_using_http/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 5,
        title: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.white70),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => const NoNotificationScreen());
            },
            child: Icon(Icons.notifications_none, color: AppColors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Obx(() {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductCircleList(productController: productController),
                const SizedBox(height: 10),
                Image.asset(AppAssets.fashionBanner),
                const SizedBox(height: 10),
                MoodBanner(),
                const SizedBox(height: 15),
                GridProductList(productController: productController),
              ],
            );
          }
        }),
      ),
    );
  }
}
