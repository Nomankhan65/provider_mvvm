import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{


  static void fieldFocusChange(BuildContext context, FocusNode  current ,FocusNode next ){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor:Colors.black45,
        textColor:Colors.white,
    );
  }

  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor:Colors.redAccent,
          content:Text(message))
    );
  }
  
}