import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fakestoreapi_using_http/controller/product_controller.dart';
import 'package:fakestoreapi_using_http/screens/details/product_details.dart';
import 'package:fakestoreapi_using_http/screens/home/widget/product_Tile.dart';

class GridProductList extends StatelessWidget {
  final ProductController productController;

  const GridProductList({super.key, required this.productController});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productController.productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: .7,
      ),
      itemBuilder: (context, index) {
        final product = productController.productList[index];
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 500 + index * 100),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 50 * (1 - value)),
                child: InkWell(
                  onTap: () => Get.to(() => ProductDetails(product)),
                  child: ProductTile(product),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
