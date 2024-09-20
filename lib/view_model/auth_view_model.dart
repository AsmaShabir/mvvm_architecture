

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repositories/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final myRepo =AuthRepository();
  bool _loading =false;
  bool get loading =>_loading;
  bool _signup =false;
  bool get signup =>_signup;
  setSignUploading(bool value){
   _signup=value;
   notifyListeners();
  }

  setloading(bool value){
  _loading=value;
  notifyListeners();
  }
 Future<void> loginApi(dynamic data,BuildContext context) async{
   setloading(true);
  myRepo.loginApi(data).then((value){
   if(kDebugMode){
    setloading(false);

    Utils.flushBarErrorMessage('Login successfully', context);
    Navigator.pushNamed(context, routesName.home);

   }
  }).onError((error,stackTrace){
   if(kDebugMode){
    Utils.flushBarErrorMessage(error.toString(), context);
   }
  });
 }
  Future<void> signUpApi(dynamic data,BuildContext context) async{
   setloading(true);
   myRepo.SignUpApi(data).then((value){
     setloading(false);
     final userPrefrence=Provider.of<UserViewModel>(context);
     userPrefrence.saveUser(
       userModel(token: value['token'].toString())

     );
    if(kDebugMode){
     setloading(false);

     Utils.flushBarErrorMessage('account created successfully', context);
     Navigator.pushNamed(context, routesName.home);

    }
   }).onError((error,stackTrace){
    if(kDebugMode){
     Utils.flushBarErrorMessage(error.toString(), context);
    }
   });
  }

}