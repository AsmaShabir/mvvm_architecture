
import 'package:mvvm/model/movielist_model.dart';
import 'package:mvvm/res/components/app_urls.dart';

import '../data/network/baseApiService.dart';
import '../data/network/networkApiService.dart';

class HomeRepository{
  BaseApiService apiService =NetworkApiService();

  Future<moviesListModel>movieListApi() async{
    try{
      dynamic response =await apiService.getGetApiResponse(AppUrl.MovieListApiEndPoint);
      return response=moviesListModel.fromJson(response);
    }
    catch(e){
      throw e;
    }
  }
}