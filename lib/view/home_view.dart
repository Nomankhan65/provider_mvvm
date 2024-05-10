import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/res/colors.dart';
import 'package:provider_mvvm/utils/routes/route_name.dart';
import 'package:provider_mvvm/view_model/user_view_model.dart';

class HomeView extends StatelessWidget {
    HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final userViewModel=Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar:AppBar(
        backgroundColor:AppColors.skyBLue,
        automaticallyImplyLeading: false,
        title:const Text('Home view',style:TextStyle(color:AppColors.white),),
        actions: [
          IconButton(onPressed: (){
            userViewModel.removeUser().then((value) => {
              Navigator.pushNamed(context, RoutesName.loginScreen),
            });
          }, icon:const Icon(Icons.logout,color:AppColors.white,)
    )
        ],
      ),
    );
  }
}
