import 'package:flutter/material.dart';
import 'package:flutter_business_template/0_presenter/screens/productDetails/components/add_to_cart.dart';
import 'package:flutter_business_template/0_presenter/screens/productDetails/components/color_and_size.dart';
import 'package:flutter_business_template/0_presenter/screens/productDetails/components/counter_with_fav_btn.dart';
import 'package:flutter_business_template/0_presenter/screens/productDetails/components/description.dart';
import 'package:flutter_business_template/0_presenter/screens/productDetails/components/product_title_with_image.dart';
import 'package:flutter_business_template/1_domain/0_entities/product.dart';
import 'package:flutter_business_template/3_shared/constants.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height - AppBar().preferredSize.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.33),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        product.color,
                      ],
                      stops: [0.8, 1],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.0, 1.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPadding / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPadding / 2),
                      CounterWithFavBtn(),
                      SizedBox(height: kDefaultPadding / 2),
                      AddToCart(product: product),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
