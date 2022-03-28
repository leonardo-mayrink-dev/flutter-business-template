import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_business_template/0_presenter/screens/mainScreen/components/categories.dart';
import 'package:flutter_business_template/0_presenter/screens/mainScreen/components/item_card.dart';
import 'package:flutter_business_template/0_presenter/screens/productDetails/productDetails.dart';
import 'package:flutter_business_template/1_domain/0_entities/product.dart';
import 'package:flutter_business_template/3_shared/constants.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.74,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
              ),
              itemBuilder: (context, index) => ItemCard(
                products[index],
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(products[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
