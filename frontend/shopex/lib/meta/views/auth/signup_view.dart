import 'package:shopex/core/notifiers/authentication.notifier.dart';
import 'auth.exports.dart';

class SignupView extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    createAccount() {
      var authenticationNotifier =
          Provider.of<AuthenticationNotifier>(context, listen: false);
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        authenticationNotifier.createAccount(
            context: context,
            username: nameController.text,
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
            Text("Hey there!", style: CustomTextStyle.heading1),
            vSizedBox1,
            Text("Welcome to Shopex!", style: CustomTextStyle.heading2),
            Text("Fill in your details.", style: CustomTextStyle.heading2),
            vSizedBox3,
            CustomWidgets.stylishTextField("Name", nameController),
            vSizedBox1,
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
                          text: "Already have an account? ",
                          style: TextStyle(
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: CustomFonts.MONTSERRAT),
                        ),
                        TextSpan(
                          text: "Login",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: LoginView(),
                                      type: PageTransitionType.rightToLeft));
                            },
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: CustomColors.textColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: CustomFonts.MONTSERRAT),
                        )
                      ]),
                    ),
                    vSizedBox2,
                    GestureDetector(
                      onTap: () => createAccount(),
                      child: Container(
                        width: 300.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(1),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w900,
                                fontFamily: CustomFonts.MONTSERRAT),
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
