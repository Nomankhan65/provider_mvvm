import '../data/network/network_api_services.dart';
import '../res/app_url.dart';

class AuthRepository{
  final apiServices=NetworkApiServices();

  Future<dynamic> loginApi(var data)async{
    dynamic response=await apiServices.postApi(data, AppUrl.loginUrl);
    return response;
  }
}