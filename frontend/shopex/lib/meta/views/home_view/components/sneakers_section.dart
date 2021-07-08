import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopex/app/routes/app.routes.dart';
import 'package:shopex/app/shared/dimensions.dart';
import 'package:shopex/app/shared/text_theme.dart';
import 'package:shopex/core/notifiers/product.notifier.dart';
import 'package:shopex/meta/views/product_details/product_details.dart';

class SneakersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productNotifier =
        Provider.of<ProductNotifier>(context, listen: false);

    _productBlock(
        {@required String title,
        @required int price,
        @required String imageUrl,
        @required dynamic productId}) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailsRoute,
              arguments: ProductDetailsArguements(id: productId));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(imageUrl))),
                  height: 150,
                  width: 200,
                ),
                vSizedBox1,
                Text(title, style: CustomTextStyle.productTitle),
                vSizedBox1,
                Text("\$${price}", style: CustomTextStyle.productPrice)
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
          Text("Sneakers for you", style: CustomTextStyle.bodyTextB1),
          vSizedBox2,
          Container(
              height: 250,
              width: 400,
              child: FutureBuilder(
                future: productNotifier.getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _productBlock(
                          productId: snapshot.data[index]['product_id'],
                          title: snapshot.data[index]['product_name'],
                          price: snapshot.data[index]['product_price'],
                          imageUrl: snapshot.data[index]['product_image']);
                    },
                  );
                },
              ))
        ],
      ),
    );
  }
}
