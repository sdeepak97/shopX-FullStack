import 'package:flutter/material.dart';

class HeaderBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home_banner.png")),
          borderRadius: BorderRadius.circular(25)),
    );
  }
}
