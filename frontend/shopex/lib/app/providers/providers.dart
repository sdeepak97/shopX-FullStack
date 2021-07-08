import 'package:provider/single_child_widget.dart';
import 'package:shopex/core/notifiers/authentication.notifier.dart';
import 'package:shopex/core/notifiers/cart.notifier.dart';
import 'package:shopex/core/notifiers/product.notifier.dart';
import 'package:shopex/core/notifiers/user.notifier.dart';
import 'package:shopex/meta/views/auth/auth.exports.dart';

List<SingleChildWidget> providers = [...remoteProviders];

List<SingleChildWidget> remoteProviders = [
  //! Signup | Login
  ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
  //! Decode user data
  ChangeNotifierProvider(create: (_) => UserNotifier()),
  //! Products
  ChangeNotifierProvider(create: (_) => ProductNotifier()),
  //! Cart data
  ChangeNotifierProvider(create: (_) => CartNotifier())
];
