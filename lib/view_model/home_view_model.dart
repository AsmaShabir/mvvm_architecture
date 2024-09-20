
import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/movielist_model.dart';

import '../repositories/home_repository.dart';

class HomeVVModel with ChangeNotifier{

  final myRepo =HomeRepository();
  ApiResponse<moviesListModel> moviesList =ApiResponse.loading();

  setMoviesList( ApiResponse<moviesListModel> response){
    moviesList=response;
    notifyListeners();
  }

  Future<void>getMoviesListApi()async{
    setMoviesList(ApiResponse.loading());
    myRepo.movieListApi().then((value){
    setMoviesList(ApiResponse.completed(value));
    }).onError((error,stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}