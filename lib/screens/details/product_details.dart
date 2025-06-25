import 'package:fakestoreapi_using_http/screens/home/widget/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/product_controller.dart';
import '../../model/product_model.dart';
import '../../utils/app_colors.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  const ProductDetails(this.product, {super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,

        iconTheme: IconThemeData(color: AppColors.white),
        actions: [
          Icon(Icons.favorite_border, color: AppColors.white),
          SizedBox(width: 5),
          Icon(Icons.share, color: AppColors.white),
          SizedBox(width: 5),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(widget.product.image ?? ''),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Text(
                widget.product.title ?? '',
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.description ?? '',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 15,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              Text(
                '₹ ${widget.product.price?.toStringAsFixed(2) ?? '0.00'}',
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),

              const SizedBox(height: 10),
              Text(
                'Size',
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.white,
                ),
              ),

              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizeCircleList(),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "size chart",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.appyellow,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                ' ${widget.product.rating?.rate ?? 0}',
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
