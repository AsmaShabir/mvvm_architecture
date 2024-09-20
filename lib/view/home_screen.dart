
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../view_model/thisView_model.dart';

class homeScreen extends StatefulWidget {
  final thisViewModel viewModel;
   homeScreen({required this.viewModel});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  HomeVVModel homeViewModel =HomeVVModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.getMoviesListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userPrefrences =Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [ InkWell(
            onTap: (){
              userPrefrences.remove().then((value){
                Navigator.pushNamed(context, routesName.login);
              });
            },
            child: Center(child: Text('Logout',)),),
            SizedBox(width: 20,),
          ]
      ),
      body: ChangeNotifierProvider<HomeVVModel>(
          create: (BuildContext context)=>homeViewModel,
        child: Consumer<HomeVVModel>(builder: (context,value,_){
          switch(value.moviesList.status){
            case Status.LOADING:
              return CircularProgressIndicator();
            case Status.ERROR:
              return Text(value.moviesList.message.toString());
            case Status.COMPLETED:
              // var data=value.moviesList.data!.movies;
              return ListView.builder(
                
                itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (context,index){
                   return Card(
                     child:ListTile(
                       title: Text(value.moviesList.data!.movies![index].title.toString()),

                       
                     ) ,
                   );
              }) ;
            case null:
              return Text('no data');
          }
        }),
      )
    );
  }
}
