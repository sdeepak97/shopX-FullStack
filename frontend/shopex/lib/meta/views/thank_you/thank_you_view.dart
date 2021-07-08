import 'package:shopex/app/routes/app.routes.dart';
import 'package:shopex/meta/views/auth/auth.exports.dart';

class ThankYouView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _backToHomeButton() {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(HomeRoute);
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child:
                  Text("Back to home", style: CustomTextStyle.productBuyNow)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Thank you!", style: CustomTextStyle.heading1),
            vSizedBox1,
            Text(
                "You'll get further details on your provided phone number. Stay tuned for your delivery!",
                style: CustomTextStyle.bodyText1),
            vSizedBox3,
            _backToHomeButton()
          ],
        ),
      ),
    );
  }
}
