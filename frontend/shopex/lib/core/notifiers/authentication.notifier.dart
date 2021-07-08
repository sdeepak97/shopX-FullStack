import 'dart:convert';
import 'dart:io';
import 'package:shopex/app/routes/app.routes.dart';
import 'package:shopex/core/api/authentication.api.dart';
import 'package:shopex/core/services/cache.service.dart';
import 'package:shopex/meta/views/auth/auth.exports.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationAPI _authenticationAPI = new AuthenticationAPI();
  final CacheService _cacheService = new CacheService();
  Future createAccount(
      {@required BuildContext context,
      @required String useremail,
      @required String username,
      @required String userpassword}) async {
    try {
      await _authenticationAPI
          .createAccount(
              useremail: useremail,
              username: username,
              userpassword: userpassword)
          .then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());
        print(parsedData);
        bool isAuthenticated = parsedData['authentication'];
        dynamic userData = parsedData['data'];
        if (isAuthenticated) {
          _cacheService
              .writeCache(key: "jwtdata", value: userData)
              .whenComplete(() {
            Navigator.of(context).pushNamed(HomeRoute);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: CustomColors.bgColor,
              content: Text(userData, style: CustomTextStyle.bodyText1)));
        }
      });
    } on SocketException {} catch (error) {
      print(error);
    }
  }

  Future login(
      {@required BuildContext context,
      @required String useremail,
      @required String userpassword}) async {
    try {
      await _authenticationAPI
          .login(useremail: useremail, userpassword: userpassword)
          .then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());
        print(parsedData);
        bool isAuthenticated = parsedData['authentication'];
        dynamic userData = parsedData['data'];
        if (isAuthenticated) {
          _cacheService
              .writeCache(key: "jwtdata", value: userData)
              .whenComplete(() {
            Navigator.of(context).pushNamed(HomeRoute);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: CustomColors.bgColor,
              content: Text(userData, style: CustomTextStyle.bodyText1)));
        }
      });
    } on SocketException {} catch (error) {
      print(error);
    }
  }
}
