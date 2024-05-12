import 'package:flutter/widgets.dart';
import 'package:provider_mvvm/data/response/api_response.dart';
import 'package:provider_mvvm/repository/home_repo.dart';

import '../model/movies_list_model.dart';

class HomeViewViewModel with ChangeNotifier{


  final _homeRepo=HomeRepository();

  ApiResponse<MoviesListModel> moviesList=ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesListModel> response){
    moviesList=response;
    notifyListeners();
  }

  Future<void> getMoviesListApi()async{
    setMoviesList(ApiResponse.loading());

   await _homeRepo.loginApi().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

}