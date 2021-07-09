import 'package:shopex/core/notifiers/authentication.notifier.dart';
import 'auth.exports.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    login() {
      var authenticationNotifier =
          Provider.of<AuthenticationNotifier>(context, listen: false);
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        authenticationNotifier.login(
            context: context,
            useremail: emailController.text,
            userpassword: passwordController.text);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: CustomColors.bgColor,
            content:
                Text("Fill in the details", style: CustomTextStyle.bodyText2)));
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.darkColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSizedBox5,
            Text("Hey There!", style: CustomTextStyle.heading1),
            vSizedBox1,
            Text("Welcome back.", style: CustomTextStyle.heading2),
            Text("You've been missed!", style: CustomTextStyle.heading2),
            vSizedBox4,
            CustomWidgets.stylishTextField("Email", emailController),
            vSizedBox1,
            CustomWidgets.stylishTextField("Password", passwordController),
            vSizedBox4,
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat"),
                        ),
                        TextSpan(
                          text: "Signup",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: SignupView(),
                                      type: PageTransitionType.rightToLeft));
                            },
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 17.0,
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat"),
                        )
                      ]),
                    ),
                    vSizedBox2,
                    GestureDetector(
                      onTap: () => login(),
                      child: Container(
                        width: 300.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(1),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w900,
                                fontFamily: "Montserrat"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
