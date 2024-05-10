import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/routes/route_name.dart';
import '../user_view_model.dart';

class SplashServices {
  UserViewModel userViewModel = UserViewModel();

  void isLogin(BuildContext context) {
    userViewModel.getUser().then((value) {
      if (value.token == null) {
        Timer(const Duration(seconds: 1), () =>
        Navigator.pushNamed(context, RoutesName.loginScreen));
      } else {
        Timer(const Duration(seconds: 1), () =>
            Navigator.pushNamed(context, RoutesName.homeScreen));
      }
    }).onError((error, stackTrace){
      print(error.toString());
    });
  }
}
