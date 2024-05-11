import 'package:provider_mvvm/model/movies_list_model.dart';

import '../data/network/network_api_services.dart';
import '../res/app_url.dart';

class HomeRepository{
  final apiServices=NetworkApiServices();

  Future<dynamic> loginApi()async{
    dynamic response=await apiServices.getApi(AppUrl.moviesUrl);
     return MoviesListModel.fromJson(response);
  }
}