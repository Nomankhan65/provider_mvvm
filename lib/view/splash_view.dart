 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
   const SplashView({super.key});

   @override
   State<SplashView> createState() => _SplashViewState();
 }


 class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices splashServices =SplashServices();
    splashServices.isLogin(context);
  }
   @override
   Widget build(BuildContext context) {
     return const Scaffold(
       body:Center(child:Text('Splash Screen'),),
     );
   }
 }
