import 'package:flutter/material.dart';
import 'package:shopex/app/shared/colors.dart';
import 'package:shopex/app/shared/dimensions.dart';
import 'package:shopex/app/shared/text_theme.dart';

class CategoryBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _categories = [
      "T-shirts",
      "Sneakers",
      "Hoodie",
      "Watch",
      "Bags"
    ];

    block(String text, IconData iconData) {
      return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: CustomColors.darkColor,
                  child: Icon(iconData),
                ),
                vSizedBox1,
                Text(text, style: CustomTextStyle.bodyText2)
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular Categories", style: CustomTextStyle.bodyTextB1),
          vSizedBox2,
          Container(
            height: 120,
            width: 400,
            child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (BuildContext context, int index) {
                return block(_categories[index], Icons.ac_unit);
              },
            ),
          )
        ],
      ),
    );
  }
}
