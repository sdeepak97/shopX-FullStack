import 'dart:convert';
import 'package:shopex/app/routes/app.routes.dart';
import 'package:shopex/core/api/cart.api.dart';
import 'package:shopex/meta/views/home_view/home.exports.dart';

class CartNotifier extends ChangeNotifier {
  final CartAPI _cartAPI = new CartAPI();

  bool _isCartEmpty = false;
  bool get isCartEmpty => _isCartEmpty;

  dynamic _cartTotal = 00;
  dynamic get cartTotal => _cartTotal;

  Future getCartProducts({@required String useremail}) async {
    var cartdata = await _cartAPI.getCartProducts(useremail: useremail);
    final Map<String, dynamic> parsedData = await jsonDecode(cartdata);
    bool received = parsedData['received'];
    bool filled = parsedData['filled'];
    if (received && filled) {
      _cartTotal = parsedData['total']
          .toString()
          .replaceAll("{sum:", "")
          .replaceAll("}", "");
      List data = parsedData['data'];
      return data;
    }
    if (received && !filled) {
      _isCartEmpty = true;
      notifyListeners();
    }
  }

  //! Add to cart
  Future addToCart(
      {@required String useremail,
      @required int product_price,
      @required String product_name}) async {
    try {
      await _cartAPI.addToCart(
          useremail: useremail,
          product_price: product_price,
          product_name: product_name);
    } catch (error) {
      print(error);
    }
  }

  //! Delete from cart
  Future deleteFromCart(
      {@required BuildContext context, @required var productId}) async {
    try {
      await _cartAPI.deleteFromCart(productId: productId).whenComplete(() {
        Navigator.of(context).pushNamed(CartRoute);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: CustomColors.bgColor,
            content: Text("Product deleted from cart",
                style: CustomTextStyle.bodyText1)));
      });
    } catch (error) {
      print(error);
    }
  }
}
