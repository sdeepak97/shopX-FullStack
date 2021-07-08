import 'package:shopex/meta/widgets/my_cart_button.dart';
import "home.exports.dart";

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CacheService _cacheService = new CacheService();

  @override
  void initState() {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    _cacheService.readCache(key: "jwtdata").then((token) =>
        {userNotifier.decodeUserData(context: context, token: token)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
          child: Column(
            children: [
              vSizedBox5,
              MaterialButton(
                  child: Text("Edit info", style: CustomTextStyle.bodyText1),
                  color: CustomColors.darkColor,
                  onPressed: () {}),
              MaterialButton(
                  child: Text("Log out", style: CustomTextStyle.bodyText1),
                  color: CustomColors.darkColor,
                  onPressed: () {
                    _cacheService.removeCache(context: context, key: "jwtdata");
                  })
            ],
          ),
          width: 150,
          color: CustomColors.bgColor),
      appBar: AppBar(backgroundColor: CustomColors.bgColor),
      floatingActionButton: MyCartButton(),
      backgroundColor: CustomColors.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              HeaderBanner(),
              vSizedBox3,
              CategoryBlock(),
              vSizedBox2,
              SneakersSection(),
            ],
          ),
        ),
      ),
    );
  }
}
