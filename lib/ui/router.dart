import 'package:flutter/material.dart';
import 'package:providerv3_arch/core/contstans/app_constants.dart';
import 'package:providerv3_arch/core/models/post.dart';
import 'package:providerv3_arch/ui/views/home_view.dart';
import 'package:providerv3_arch/ui/views/login_view.dart';
import 'package:providerv3_arch/ui/views/post_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.HomeView:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.LoginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.PostView:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
