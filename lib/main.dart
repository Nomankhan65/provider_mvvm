import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/utils/routes/route_name.dart';
import 'package:provider_mvvm/utils/routes/routes.dart';
import 'package:provider_mvvm/view_model/login_view_model.dart';
import 'package:provider_mvvm/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
 return MultiProvider(providers: [
   ChangeNotifierProvider(create: (_)=>LoginViewModel()),
   ChangeNotifierProvider(create: (_)=>UserViewModel()),
 ],
 child:MaterialApp(
   title: 'Flutter Demo',
   theme: ThemeData(
     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
     useMaterial3: true,
   ),
   initialRoute:RoutesName.splashScreen,
   onGenerateRoute:Routes.generateRoute,
   debugShowCheckedModeBanner:false,
 ),
 );
  }
}
