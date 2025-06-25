import 'package:fakestoreapi_using_http/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fakestoreapi_using_http/controller/product_controller.dart';
import 'package:fakestoreapi_using_http/screens/details/product_details.dart';

class ProductCircleList extends StatelessWidget {
  final ProductController productController;

  const ProductCircleList({super.key, required this.productController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: productController.productList.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final product = productController.productList[index];
              return GestureDetector(
                onTap: () => Get.to(ProductDetails(product)),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 237, 215, 15),
                            const Color.fromARGB(255, 31, 233, 115),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: AppColors.black,
                        child: ClipOval(
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                            width: 56,
                            height: 56,
                            errorBuilder:
                                (_, __, ___) => const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
