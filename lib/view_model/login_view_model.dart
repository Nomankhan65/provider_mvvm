import 'package:flutter/cupertino.dart';
import 'package:provider_mvvm/model/user_model.dart';
import 'package:provider_mvvm/repository/auth_repo.dart';
import 'package:provider_mvvm/utils/routes/route_name.dart';
import 'package:provider_mvvm/utils/utils.dart';
import 'package:provider_mvvm/view_model/user_view_model.dart';

class LoginViewModel with ChangeNotifier {
  var authRepo = AuthRepository();
  UserViewModel userViewModel=UserViewModel();

  bool _loading = false;
  get loading => _loading;

  void isLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  Future<void> login(dynamic data, BuildContext context) async {
    isLoading(true);
      authRepo.loginApi(data).then((value) {
        UserModel userModel=UserModel(token:value['token']);
        userViewModel.saveUser(userModel).then((value) {
          Utils.toastMessage('Login success');
          Navigator.pushNamed(context, RoutesName.homeScreen);
          isLoading(false);
        });
    }).onError((error, stackTrace) {
      isLoading(false);
      Utils.snackBar(error.toString(), context);
      print(error.toString());
    });
  }
}
