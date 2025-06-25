import 'package:fakestoreapi_using_http/model/product_model.dart';
import 'package:fakestoreapi_using_http/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;

  const ProductTile(this.productModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 237, 215, 15), Color(0xFF00C853)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(productModel.image!),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                productModel.title!.length > 15
                    ? '${productModel.title!.substring(0, 15)}...'
                    : productModel.title!,
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                '\$${productModel.price!}',
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...List.generate(5, (index) {
                    double rating = productModel.rating?.rate ?? 0;
                    if (rating >= index + 1) {
                      return const Icon(
                        Icons.star,
                        color: AppColors.appyellow,
                        size: 14,
                      );
                    } else if (rating > index && rating < index + 1) {
                      return const Icon(
                        Icons.star_half,
                        color: AppColors.appyellow,
                        size: 14,
                      );
                    } else {
                      return const Icon(
                        Icons.star_border,
                        color: AppColors.appyellow,
                        size: 14,
                      );
                    }
                  }),
                  const SizedBox(width: 5),
                  Text(
                    productModel.rating?.rate?.toStringAsFixed(1) ?? '0.0',
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
