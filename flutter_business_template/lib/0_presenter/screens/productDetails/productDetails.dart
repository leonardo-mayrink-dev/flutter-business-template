import 'package:flutter/material.dart';
import 'package:flutter_business_template/0_presenter/screens/productDetails/components/details_body.dart';
import 'package:flutter_business_template/1_domain/0_entities/product.dart';
import 'package:flutter_business_template/3_shared/constants.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: DetailsBody(product),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/cart.svg"),
        ),
        SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
