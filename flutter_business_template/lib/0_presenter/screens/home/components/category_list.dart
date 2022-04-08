import 'package:flutter/material.dart';
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
    return Container(
      width: ScreenConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
