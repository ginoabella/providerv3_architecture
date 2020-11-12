import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerv3_arch/core/contstans/app_constants.dart';
import 'package:providerv3_arch/provider_setup.dart';
import 'package:providerv3_arch/ui/router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.LoginView,
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}
