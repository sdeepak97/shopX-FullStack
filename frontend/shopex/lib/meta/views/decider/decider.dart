import 'package:shopex/core/services/cache.service.dart';
import 'package:shopex/meta/views/auth/auth.exports.dart';
import 'package:shopex/meta/views/home_view/home_view.dart';

class DeciderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CacheService _cacheService = new CacheService();
    return FutureBuilder(
      future: _cacheService.readCache(key: "jwtdata"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeView();
        } else {
          return LoginView();
        }
      },
    );
  }
}
