import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_mvvm/res/colors.dart';

class MyButton extends StatelessWidget {

  final VoidCallback onTap;
  String title;
  final bool loading;

    MyButton({super.key,required this.onTap,required this.title, this.loading=false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20,vertical:2),
        child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor:AppColors.skyBLue,
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(20),
              )
            ),
            onPressed:onTap, child:loading?const CircularProgressIndicator(color:AppColors.white,strokeWidth:2):Text(title,style:const TextStyle(color:AppColors.white),)),
      ),
    );
  }
}
