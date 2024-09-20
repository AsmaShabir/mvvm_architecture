

import 'package:mvvm/data/network/baseApiService.dart';
import 'package:mvvm/data/network/networkApiService.dart';
import 'package:mvvm/res/components/app_urls.dart';

class AuthRepository{

  BaseApiService apiService =NetworkApiService();

  Future<dynamic>loginApi(dynamic data) async{
    try{
      dynamic response =await apiService.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }
        catch(e){
      throw e;
        }
  }
  Future<dynamic>SignUpApi(dynamic data) async{
    try{
      dynamic response =await apiService.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
}