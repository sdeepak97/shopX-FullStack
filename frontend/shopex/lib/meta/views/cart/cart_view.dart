import 'package:shopex/app/routes/app.routes.dart';
import 'package:shopex/core/notifiers/cart.notifier.dart';
import 'package:shopex/core/notifiers/user.notifier.dart';
import 'package:shopex/meta/views/auth/auth.exports.dart';
import 'package:shopex/meta/widgets/custom_back_button.dart';
import 'package:shopex/meta/widgets/payment_button.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    final cartNotifier = Provider.of<CartNotifier>(context, listen: false);
    bottomBar() {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    "\$${Provider.of<CartNotifier>(context, listen: true).cartTotal}",
                    style: CustomTextStyle.productPriceDetails),
                PaymentButton(
                  useremail: userNotifier.cachedUserEmail,
                  username: userNotifier.cachedUserEmail,
                  amount: Provider.of<CartNotifier>(context, listen: true)
                      .cartTotal,
                  userphoneno: "123456789",
                )
              ],
            )
          ],
        ),
        height: 100,
        width: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: CustomColors.darkColor),
      );
    }

    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomBackButton(route: HomeRoute),
            Text("Hello ${userNotifier.cachedUserEmail}!",
                style: CustomTextStyle.yellowText1),
            Text("My Cart", style: CustomTextStyle.heading1),
            vSizedBox1,
            Container(
                height: 550,
                child: FutureBuilder(
                  future: cartNotifier.getCartProducts(
                      useremail: userNotifier.cachedUserEmail),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData) {
                      return Center(
                          child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/empty.png"))),
                      ));
                    } else {
                      return ListView.builder(
                          physics: ClampingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) => ListTile(
                              title: Text(snapshot.data[index]['product_name'],
                                  style: CustomTextStyle.productTitle),
                              trailing: IconButton(
                                onPressed: () {
                                  cartNotifier.deleteFromCart(
                                      context: context,
                                      productId: snapshot.data[index]
                                          ['product_id']);
                                },
                                icon: Icon(Icons.delete,
                                    color: CustomColors.whiteColor),
                              ),
                              subtitle: Text(
                                  "\$${snapshot.data[index]['product_price']}",
                                  style: CustomTextStyle.bodyText1)));
                    }
                  },
                )),
            bottomBar()
          ],
        ),
      ),
    );
  }
}
