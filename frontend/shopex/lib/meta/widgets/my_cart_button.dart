import 'package:flutter/material.dart';
import 'package:shopex/app/routes/app.routes.dart';
import 'package:shopex/app/shared/colors.dart';
import 'package:shopex/app/shared/text_theme.dart';

class MyCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CartRoute);
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            color: CustomColors.whiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text("My Cart", style: CustomTextStyle.productBuyNow)),
      ),
    );
  }
}
