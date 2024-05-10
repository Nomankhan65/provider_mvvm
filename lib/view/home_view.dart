import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        title:const Text('Home view'),
      ),
    );
  }
}
