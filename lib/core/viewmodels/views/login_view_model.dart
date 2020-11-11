import 'package:flutter/foundation.dart';

import 'package:providerv3_arch/core/services/authentication_service.dart';
import 'package:providerv3_arch/core/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;

  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    final userId = int.tryParse(userIdText);
    final success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}
