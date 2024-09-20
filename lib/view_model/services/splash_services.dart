

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class splashServices{

  Future<userModel>getUserData()=>UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) async {
       if(value.token=='null'||value.token==""){
         await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, routesName.login);
       }
       else{
         await Future.delayed(Duration(seconds: 3));
         Navigator.pushNamed(context, routesName.home);

       }
    }).onError((error,stackTrace){

      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}