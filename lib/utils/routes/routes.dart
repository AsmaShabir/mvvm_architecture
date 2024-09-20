

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/signup_view.dart';
import 'package:mvvm/view/splash_view.dart';
import 'package:mvvm/view/thisView.dart';
import 'package:mvvm/view_model/thisView_model.dart';

import '../../view/login_screen.dart';

class routes{
  static Route<dynamic>generateRoute(RouteSettings settings){

      switch(settings.name){
        case routesName.splash:
          return MaterialPageRoute(builder: (BuildContext context)=>SplashView());
        case routesName.home:
          return MaterialPageRoute(builder: (BuildContext context)=>homeScreen(viewModel:thisViewModel("This is Asma")));

        case routesName.view:
          final arg=settings.arguments as thisViewModel;
          return MaterialPageRoute(builder: (BuildContext context)=>Thisview(viewModel:arg));
        case routesName.login:
          return MaterialPageRoute(builder: (BuildContext context)=>loginView());
        case routesName.signup:
          return MaterialPageRoute(builder: (BuildContext context)=>signUpView());
        default:
          return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
          });
      }


  }
}