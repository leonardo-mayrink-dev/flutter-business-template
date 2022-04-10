import 'package:flutter/material.dart';
import 'package:flutter_business_template/1_domain/0_entities/product.dart';
import 'package:flutter_business_template/3_shared/constants.dart';
import 'package:flutter_business_template/3_shared/screen_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCardd extends StatefulWidget {
  const ItemCardd({Key? key}) : super(key: key);

  @override
  State<ItemCardd> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCardd> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    color: Color(0xFFB0CCE1).withOpacity(0.32)),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  //NavigatorUtil.navegarParaTelaComParametro(
                  //  DetailsScreen.routeName, DetailsScreen(product: this.product));
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.13),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          products[0].image,
                          //width: size.width * 0.18,
                        ),
                      ),
                      Text(products[0].title),
                      SizedBox(height: 10),
                      Text(
                        "Teste",
                        //products[0].description,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    color: Color(0xFFB0CCE1).withOpacity(0.32)),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  //NavigatorUtil.navegarParaTelaComParametro(
                  //  DetailsScreen.routeName, DetailsScreen(product: this.product));
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.13),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          products[0].image,
                          //width: size.width * 0.18,
                        ),
                      ),
                      Text(products[0].title),
                      SizedBox(height: 10),
                      Text(
                        "Teste",
                        //products[0].description,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    color: Color(0xFFB0CCE1).withOpacity(0.32)),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  //NavigatorUtil.navegarParaTelaComParametro(
                  //  DetailsScreen.routeName, DetailsScreen(product: this.product));
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.13),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          products[0].image,
                          //width: size.width * 0.18,
                        ),
                      ),
                      Text(products[0].title),
                      SizedBox(height: 10),
                      Text(
                        "Teste",
                        //products[0].description,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
