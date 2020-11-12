import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerv3_arch/core/contstans/app_constants.dart';
import 'package:providerv3_arch/core/viewmodels/views/login_view_model.dart';
import 'package:providerv3_arch/ui/shared/app_colors.dart';
import 'package:providerv3_arch/ui/views/base_widget.dart';
import 'package:providerv3_arch/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(
        // Inject authentication service setup in the provider_setup
        authenticationService: Provider.of(context),
      ),
      child: LoginHeader(controller: _controller),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            model.busy
                ? CircularProgressIndicator()
                : FlatButton(
                    onPressed: () async {
                      final loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, RoutePaths.HomeView);
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
