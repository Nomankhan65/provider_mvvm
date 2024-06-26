import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_mvvm/utils/routes/route_name.dart';
import 'package:provider_mvvm/view/home_view.dart';
import 'package:provider_mvvm/view/login_view.dart';
import 'package:provider_mvvm/view/splash_view.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder:(BuildContext context)=> HomeView());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder:(BuildContext context)=>const LoginView());
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder:(BuildContext context)=>const SplashView());
        default:
          return MaterialPageRoute(builder: (_){
            return const Scaffold(
              body:Center(
                child:Text('No route defined'),
              ),
            );
          });
    }
  }
}