import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopex/app/routes/api.routes.dart';

class UserAPI {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future decodeUserData({@required String token}) async {
    final subUrl = "/user/verify";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.get(uri, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Access-Control-Allow-Origin": "*",
      "Authorization": "$token"
    });
    final body = response.body;
    return body;
  }
}
