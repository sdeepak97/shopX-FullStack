import 'package:flutter/material.dart';
import 'package:shopex/meta/views/auth/login_view.dart';
import 'package:shopex/meta/views/auth/signup_view.dart';
import 'package:shopex/meta/views/cart/cart_view.dart';
import 'package:shopex/meta/views/decider/decider.dart';
import 'package:shopex/meta/views/home_view/home_view.dart';
import 'package:shopex/meta/views/product_details/product_details.dart';
import 'package:shopex/meta/views/splash_screen/splash_view.dart';
import 'package:shopex/meta/views/thank_you/thank_you_view.dart';

final String DeciderRoute = "/decider";
final String SplashRoute = "/splash";
final String HomeRoute = "/";
final String LoginRoute = "/login";
final String SignupRoute = "/signup";
final String ProductDetailsRoute = "/details";
final String CartRoute = "/cart";
final String ThankYouRoute = "/thank-you";

final routes = {
  DeciderRoute: (context) => DeciderView(),
  HomeRoute: (context) => HomeView(),
  SplashRoute: (context) => SplashView(),
  SignupRoute: (context) => SignupView(),
  LoginRoute: (context) => LoginView(),
  CartRoute: (context) => CartView(),
  ThankYouRoute: (context) => ThankYouView(),
  ProductDetailsRoute: (context) => ProductDetails(
      productDetailsArguements:
          ModalRoute.of(context).settings.arguments as dynamic)
};
