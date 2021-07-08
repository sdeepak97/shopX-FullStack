import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopex/app/routes/app.routes.dart';

import 'app/providers/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Core());
}

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers, child: Lava());
  }
}

class Lava extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DeciderRoute,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
