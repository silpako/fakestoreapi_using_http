import 'package:fakestoreapi_using_http/controller/product_controller.dart';
import 'package:fakestoreapi_using_http/screens/cart/empty_cart.dart';
import 'package:fakestoreapi_using_http/screens/home/home_screen.dart';
import 'package:fakestoreapi_using_http/screens/profile/profile.dart';
import 'package:fakestoreapi_using_http/screens/splash.dart';
import 'package:fakestoreapi_using_http/screens/wishlist/empty_wishlist.dart';
import 'package:fakestoreapi_using_http/utils/app_colors.dart';
import 'package:fakestoreapi_using_http/utils/gradient_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
  );
}

class ProductMain extends StatelessWidget {
  ProductMain({super.key});
  final ProductController productController = Get.put(ProductController());

  final RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomeScreen(),
    EmptyWishlistScreen(),
    EmptyCartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.black,
        body: pages[selectedIndex.value],
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            backgroundColor: AppColors.black,
            currentIndex: selectedIndex.value,
            onTap: (index) => selectedIndex.value = index,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.appyellow,
            unselectedItemColor: AppColors.white,
            items: [
              BottomNavigationBarItem(
                icon:
                    selectedIndex.value == 0
                        ? GradientIcon(Icons.home)
                        : Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon:
                    selectedIndex.value == 1
                        ? GradientIcon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon:
                    selectedIndex.value == 2
                        ? GradientIcon(Icons.shopping_cart)
                        : Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon:
                    selectedIndex.value == 3
                        ? GradientIcon(Icons.person)
                        : Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          );
        }),
      );
    });
  }
}
