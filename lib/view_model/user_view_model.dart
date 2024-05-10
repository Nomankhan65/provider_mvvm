import 'package:flutter/cupertino.dart';
import 'package:provider_mvvm/utils/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserViewModel with ChangeNotifier {

  Future<bool> saveUser(UserModel userModel)async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString('token',userModel.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    String? token =sp.getString('token');
    notifyListeners();
    print(token);
    return UserModel(
      token:token,
    );
  }

  Future<bool> removeUser()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
   await sp.remove('token');
    return true;
  }
}