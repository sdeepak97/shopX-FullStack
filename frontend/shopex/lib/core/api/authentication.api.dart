import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopex/app/routes/api.routes.dart';
import 'package:shopex/meta/views/auth/auth.exports.dart';

class AuthenticationAPI {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future createAccount(
      {@required String useremail,
      @required String username,
      @required String userpassword}) async {
    final subUrl = "/user/create-account";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "username": username,
          "useremail": useremail,
          "userpassword": userpassword
        }));
    final body = response.body;
    print("body dint received");
    return body;
  }

  Future login(
      {@required String useremail, @required String userpassword}) async {
    final subUrl = "/user/login";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body:
            jsonEncode({"useremail": useremail, "userpassword": userpassword}));
    final body = response.body;
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      return body;
    }
  }
}
