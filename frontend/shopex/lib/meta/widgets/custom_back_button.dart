import 'package:flutter/material.dart';
import 'package:shopex/app/shared/colors.dart';

class CustomBackButton extends StatelessWidget {
  final String route;
  const CustomBackButton({@required this.route});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(route);
            },
            icon: Icon(Icons.arrow_back_ios, color: CustomColors.whiteColor))
      ],
    );
  }
}
