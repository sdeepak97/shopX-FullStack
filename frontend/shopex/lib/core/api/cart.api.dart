import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopex/app/routes/api.routes.dart';

class CartAPI {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future getCartProducts({@required String useremail}) async {
    final subUrl = "/cart/$useremail";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.get(uri, headers: headers);
    final body = response.body;
    return body;
  }

  Future addToCart(
      {@required String useremail,
      @required int product_price,
      @required String product_name}) async {
    final subUrl = "/cart/add-to-cart";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.post(uri,
        body: jsonEncode({
          "useremail": useremail,
          "product_price": product_price,
          "product_name": product_name
        }),
        headers: headers);
    final body = response.body;
    return body;
  }

  Future deleteFromCart({@required var productId}) async {
    final subUrl = "/cart/delete/$productId";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.delete(uri, headers: headers);
    final body = response.body;
    return body;
  }
}
