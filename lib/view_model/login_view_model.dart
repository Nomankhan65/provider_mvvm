import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider_mvvm/repository/auth_repo.dart';
import 'package:provider_mvvm/utils/routes/route_name.dart';
import 'package:provider_mvvm/utils/utils.dart';

class LoginViewModel with ChangeNotifier {
  var authRepo = AuthRepository();

  bool _loading = false;
  get loading => _loading;

  void isLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    isLoading(true);
      authRepo.loginApi(data).then((value) {
      isLoading(false);
      Utils.toastMessage('Login success');
        Navigator.pushNamed(context, RoutesName.homeScreen);
        print(value.toString());
    }).onError((error, stackTrace) {
      isLoading(false);
      Utils.snackBar(error.toString(), context);
      print(error.toString());
    });
  }
}
