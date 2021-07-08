import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopex/app/routes/app.routes.dart';
import 'package:shopex/app/shared/colors.dart';
import 'package:shopex/app/shared/text_theme.dart';

class PaymentButton extends StatefulWidget {
  final dynamic amount;
  final String username, useremail, userphoneno;
  const PaymentButton(
      {@required this.amount,
      @required this.username,
      @required this.useremail,
      @required this.userphoneno});
  @override
  _PaymentButtonState createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
  Razorpay _razorpay;
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.of(context).pushNamed(ThankYouRoute);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response.code);
    print(response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response.walletName);
  }

  void openCheckout() async {
    var options = {
      'key': 'Your razorpay key',
      'amount': widget.amount,
      'name': widget.username,
      'description': 'Shopex cart',
      'prefill': {'contact': widget.userphoneno, 'email': widget.useremail},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openCheckout(),
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
            color: CustomColors.whiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text("Checkout", style: CustomTextStyle.productBuyNow)),
      ),
    );
  }
}
