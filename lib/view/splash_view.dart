

import 'package:flutter/material.dart';

import '../view_model/services/splash_services.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
splashServices SplashServices= splashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  SplashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("splash Screen",style: Theme.of(context).textTheme.headlineMedium,),
      )
    );
  }
}
