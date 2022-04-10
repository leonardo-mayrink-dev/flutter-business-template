import 'package:flutter/material.dart';
import 'package:flutter_business_template/1_domain/0_entities/category.dart';
import 'package:flutter_business_template/3_shared/constants.dart';
import 'package:flutter_business_template/3_shared/screen_config.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: <Widget>[
                Text(
                  categoryList[0].categoryName,
                  style: categoryList[0].isActive
                      ? TextStyle(
                          color: kTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)
                      : TextStyle(fontSize: 14),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 3,
                  width: 22,
                  decoration: BoxDecoration(
                    color: categoryList[1].isActive
                        ? kPrimaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          )),
      GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: <Widget>[
                Text(
                  categoryList[2].categoryName,
                  style: categoryList[2].isActive
                      ? TextStyle(
                          color: kTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)
                      : TextStyle(fontSize: 14),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 3,
                  width: 22,
                  decoration: BoxDecoration(
                    color: categoryList[1].isActive
                        ? kPrimaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          )),
      GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: <Widget>[
                Text(
                  categoryList[2].categoryName,
                  style: categoryList[2].isActive
                      ? TextStyle(
                          color: kTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)
                      : TextStyle(fontSize: 14),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 3,
                  width: 22,
                  decoration: BoxDecoration(
                    color: categoryList[1].isActive
                        ? kPrimaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          )),
    ]);
  }
}
