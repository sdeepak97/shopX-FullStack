import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopex/app/routes/api.routes.dart';

class ProductAPI {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future getProducts() async {
    final subUrl = "/products";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.get(uri, headers: headers);
    final body = response.body;
    final Map<String, dynamic> data = await jsonDecode(body);
    final productData = data['data'];
    final received = data['received'];
    if (received) {
      return productData;
    }
  }

  Future loadProductDetails({@required dynamic productID}) async {
    final subUrl = "/products/details/$productID";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.get(uri, headers: headers);
    final body = response.body;
    return body;
  }
}
