import 'dart:convert';
import 'package:shopex/app/routes/app.routes.dart';
import 'package:shopex/core/api/user.api.dart';
import 'package:shopex/meta/views/auth/auth.exports.dart';

class UserNotifier extends ChangeNotifier {
  final UserAPI _userAPI = new UserAPI();
  //! User email
  String _cachedUserEmail;
  String get cachedUserEmail => _cachedUserEmail;

  Future decodeUserData(
      {@required BuildContext context, @required String token}) async {
    try {
      _userAPI.decodeUserData(token: token).then((value) async {
        final Map<String, dynamic> parsedData = await jsonDecode(value);
        var userdata = parsedData['data'];
        if (userdata != null) {
          _cachedUserEmail = parsedData['data']['useremail'];
        }
        if (parsedData['data'] == null) {
          Navigator.of(context).pushNamed(LoginRoute);
        }
        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
  }
}
