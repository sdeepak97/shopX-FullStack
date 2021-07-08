import 'dart:convert';
import 'package:shopex/app/routes/app.routes.dart';
import 'package:shopex/core/notifiers/cart.notifier.dart';
import 'package:shopex/core/notifiers/product.notifier.dart';
import 'package:shopex/core/notifiers/user.notifier.dart';
import 'package:shopex/meta/views/auth/auth.exports.dart';
import 'package:shopex/meta/widgets/custom_back_button.dart';

class ProductDetails extends StatefulWidget {
  final ProductDetailsArguements productDetailsArguements;
  const ProductDetails({this.productDetailsArguements});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    final cartNotifier = Provider.of<CartNotifier>(context, listen: false);
    List<int> _size = [8, 9, 10, 11];
    buyNowButton(
        {@required String useremail,
        @required int product_price,
        @required String product_name}) {
      return GestureDetector(
        onTap: () async {
          await cartNotifier
              .addToCart(
                  useremail: useremail,
                  product_price: product_price,
                  product_name: product_name)
              .whenComplete(() {
            Navigator.of(context).pushNamed(CartRoute);
          });
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text("Add to cart", style: CustomTextStyle.productBuyNow)),
        ),
      );
    }

    sizeBlock(int size) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 80,
          height: 40,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "US ${size}",
                style: CustomTextStyle.productSizeDetails,
              ),
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: CustomColors.textColor),
              borderRadius: BorderRadius.circular(10)),
        ),
      );
    }

    bottomBar(
        {@required int price,
        @required String useremail,
        @required String product_name}) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSizedBox3,
            Text("Choose size", style: CustomTextStyle.faintText2),
            vSizedBox2,
            Container(
              height: 50,
              width: 500,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _size.length,
                itemBuilder: (BuildContext context, int index) {
                  return sizeBlock(_size[index]);
                },
              ),
            ),
            vSizedBox3,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("\$${price}", style: CustomTextStyle.productPriceDetails),
                buyNowButton(
                    product_name: product_name,
                    product_price: price,
                    useremail: useremail)
              ],
            )
          ],
        ),
        height: 250,
        width: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: CustomColors.darkColor),
      );
    }

    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: Container(
        child: Consumer<ProductNotifier>(
          builder: (context, notifier, _) {
            return Center(
                child: FutureBuilder(
              future: notifier.loadProductDetails(
                  productID: widget.productDetailsArguements.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var productData = snapshot.data;
                final Map<String, dynamic> data = jsonDecode(productData);
                var product_name = data['product_name'];
                var product_category = data['product_category'];
                var product_price = data['product_price'];
                var product_image = data['product_image'];
                var product_description = data['product_description'];
                // var product_id = data['product_id'];
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomBackButton(route: HomeRoute),
                    Text(product_category, style: CustomTextStyle.faintText2),
                    vSizedBox1,
                    Text(product_name,
                        style: CustomTextStyle.productTitleDetails),
                    vSizedBox1,
                    Text(product_description,
                        style: CustomTextStyle.faintText2),
                    vSizedBox2,
                    Container(
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(product_image))),
                    ),
                    vSizedBox2,
                    bottomBar(
                        useremail: userNotifier.cachedUserEmail,
                        product_name: product_name,
                        price: product_price)
                  ],
                );
              },
            ));
          },
        ),
      ),
    );
  }
}

class ProductDetailsArguements {
  final dynamic id;
  const ProductDetailsArguements({@required this.id});
}
