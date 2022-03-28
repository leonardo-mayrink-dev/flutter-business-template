import 'package:flutter/material.dart';
import 'package:flutter_business_template/1_domain/0_entities/product.dart';
import 'package:flutter_business_template/3_shared/constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function()? press;

  const ItemCard(this.product, this.press, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              product.title,
              style: TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Text(
            "\$${product.price.toString()}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
